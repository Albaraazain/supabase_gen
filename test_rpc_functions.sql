-- Test RPC Functions for Supabase Gen Package
-- This file contains sample RPC functions to test the RPC generation functionality

-- Authentication Functions
CREATE OR REPLACE FUNCTION auth_get_user_profile(user_id_param UUID)
RETURNS TABLE(
  id UUID,
  full_name TEXT,
  email TEXT,
  phone TEXT,
  user_type TEXT,
  is_verified BOOLEAN,
  created_at TIMESTAMPTZ
) 
LANGUAGE plpgsql SECURITY DEFINER
AS $$
BEGIN
  RETURN QUERY
  SELECT 
    p.id,
    p.full_name,
    p.email,
    p.phone,
    p.user_type,
    p.is_verified,
    p.created_at
  FROM profiles p
  WHERE p.id = user_id_param;
END;
$$;
COMMENT ON FUNCTION auth_get_user_profile IS 'Get complete user profile information';

CREATE OR REPLACE FUNCTION auth_update_user_profile(
  user_id_param UUID,
  full_name_param TEXT DEFAULT NULL,
  phone_param TEXT DEFAULT NULL
)
RETURNS BOOLEAN
LANGUAGE plpgsql SECURITY DEFINER
AS $$
BEGIN
  UPDATE profiles 
  SET 
    full_name = COALESCE(full_name_param, full_name),
    phone = COALESCE(phone_param, phone),
    updated_at = NOW()
  WHERE id = user_id_param;
  
  RETURN FOUND;
END;
$$;
COMMENT ON FUNCTION auth_update_user_profile IS 'Update user profile information';

-- Analytics Functions
CREATE OR REPLACE FUNCTION analytics_get_ride_stats(
  start_date DATE,
  end_date DATE
)
RETURNS TABLE(
  total_rides BIGINT,
  completed_rides BIGINT,
  cancelled_rides BIGINT,
  average_rating NUMERIC(3,2),
  total_revenue NUMERIC(10,2)
)
LANGUAGE plpgsql SECURITY DEFINER
AS $$
BEGIN
  RETURN QUERY
  SELECT 
    COUNT(*) as total_rides,
    COUNT(*) FILTER (WHERE status = 'completed') as completed_rides,
    COUNT(*) FILTER (WHERE status = 'cancelled') as cancelled_rides,
    AVG(rating) as average_rating,
    SUM(fare_amount) as total_revenue
  FROM trips
  WHERE DATE(created_at) BETWEEN start_date AND end_date;
END;
$$;
COMMENT ON FUNCTION analytics_get_ride_stats IS 'Get comprehensive ride statistics for a date range';

CREATE OR REPLACE FUNCTION analytics_get_driver_performance(driver_id_param UUID)
RETURNS JSONB
LANGUAGE plpgsql SECURITY DEFINER
AS $$
DECLARE
  result JSONB;
BEGIN
  SELECT jsonb_build_object(
    'total_trips', COUNT(*),
    'average_rating', AVG(rating),
    'total_earnings', SUM(fare_amount),
    'completion_rate', (COUNT(*) FILTER (WHERE status = 'completed')::FLOAT / COUNT(*) * 100)::NUMERIC(5,2),
    'last_30_days', jsonb_build_object(
      'trips', COUNT(*) FILTER (WHERE created_at >= NOW() - INTERVAL '30 days'),
      'earnings', SUM(fare_amount) FILTER (WHERE created_at >= NOW() - INTERVAL '30 days')
    )
  ) INTO result
  FROM trips 
  WHERE driver_id = driver_id_param;
  
  RETURN result;
END;
$$;
COMMENT ON FUNCTION analytics_get_driver_performance IS 'Get comprehensive driver performance metrics';

-- Business Logic Functions
CREATE OR REPLACE FUNCTION business_calculate_fare(
  pickup_lat DOUBLE PRECISION,
  pickup_lng DOUBLE PRECISION,
  dropoff_lat DOUBLE PRECISION,
  dropoff_lng DOUBLE PRECISION,
  ride_type TEXT DEFAULT 'standard'
)
RETURNS NUMERIC(8,2)
LANGUAGE plpgsql
AS $$
DECLARE
  distance_km NUMERIC;
  base_fare NUMERIC := 5.00;
  per_km_rate NUMERIC := 2.50;
  multiplier NUMERIC := 1.0;
  calculated_fare NUMERIC;
BEGIN
  -- Calculate distance using Haversine formula (simplified)
  SELECT (
    6371 * acos(
      cos(radians(pickup_lat)) * 
      cos(radians(dropoff_lat)) * 
      cos(radians(dropoff_lng) - radians(pickup_lng)) + 
      sin(radians(pickup_lat)) * 
      sin(radians(dropoff_lat))
    )
  ) INTO distance_km;
  
  -- Apply ride type multiplier
  CASE ride_type
    WHEN 'premium' THEN multiplier := 1.5;
    WHEN 'luxury' THEN multiplier := 2.0;
    ELSE multiplier := 1.0;
  END CASE;
  
  calculated_fare := (base_fare + (distance_km * per_km_rate)) * multiplier;
  
  RETURN ROUND(calculated_fare, 2);
END;
$$;
COMMENT ON FUNCTION business_calculate_fare IS 'Calculate ride fare based on distance and ride type';

CREATE OR REPLACE FUNCTION business_find_nearby_drivers(
  latitude DOUBLE PRECISION,
  longitude DOUBLE PRECISION,
  radius_km INTEGER DEFAULT 5,
  max_results INTEGER DEFAULT 10
)
RETURNS TABLE(
  driver_id UUID,
  driver_name TEXT,
  vehicle_type TEXT,
  rating NUMERIC(3,2),
  distance_km NUMERIC(5,2),
  estimated_arrival_minutes INTEGER
)
LANGUAGE plpgsql SECURITY DEFINER
AS $$
BEGIN
  RETURN QUERY
  SELECT 
    p.id as driver_id,
    p.full_name as driver_name,
    v.vehicle_type,
    p.average_rating as rating,
    (
      6371 * acos(
        cos(radians(latitude)) * 
        cos(radians(ST_Y(dl.current_location::geometry))) * 
        cos(radians(ST_X(dl.current_location::geometry)) - radians(longitude)) + 
        sin(radians(latitude)) * 
        sin(radians(ST_Y(dl.current_location::geometry)))
      )
    )::NUMERIC(5,2) as distance_km,
    (
      6371 * acos(
        cos(radians(latitude)) * 
        cos(radians(ST_Y(dl.current_location::geometry))) * 
        cos(radians(ST_X(dl.current_location::geometry)) - radians(longitude)) + 
        sin(radians(latitude)) * 
        sin(radians(ST_Y(dl.current_location::geometry)))
      ) * 60 / 30  -- Assuming 30 km/h average speed
    )::INTEGER as estimated_arrival_minutes
  FROM profiles p
  JOIN driver_availability da ON p.id = da.driver_id
  JOIN driver_locations dl ON p.id = dl.driver_id
  LEFT JOIN vehicles v ON p.id = v.driver_id
  WHERE 
    p.user_type = 'driver'
    AND da.is_available = true
    AND ST_DWithin(
      dl.current_location::geography,
      ST_SetSRID(ST_MakePoint(longitude, latitude), 4326)::geography,
      radius_km * 1000
    )
  ORDER BY distance_km
  LIMIT max_results;
END;
$$;
COMMENT ON FUNCTION business_find_nearby_drivers IS 'Find available drivers within specified radius';

-- Search Functions
CREATE OR REPLACE FUNCTION search_trips_by_criteria(
  user_id_param UUID,
  status_filter TEXT DEFAULT NULL,
  date_from DATE DEFAULT NULL,
  date_to DATE DEFAULT NULL,
  limit_param INTEGER DEFAULT 20,
  offset_param INTEGER DEFAULT 0
)
RETURNS TABLE(
  trip_id UUID,
  pickup_address TEXT,
  dropoff_address TEXT,
  status TEXT,
  fare_amount NUMERIC(8,2),
  created_at TIMESTAMPTZ,
  driver_name TEXT,
  vehicle_info TEXT
)
LANGUAGE plpgsql SECURITY DEFINER
AS $$
BEGIN
  RETURN QUERY
  SELECT 
    t.id as trip_id,
    t.pickup_address,
    t.dropoff_address,
    t.status,
    t.fare_amount,
    t.created_at,
    p.full_name as driver_name,
    CONCAT(v.make, ' ', v.model, ' (', v.license_plate, ')') as vehicle_info
  FROM trips t
  LEFT JOIN profiles p ON t.driver_id = p.id
  LEFT JOIN vehicles v ON t.driver_id = v.driver_id
  WHERE 
    t.passenger_id = user_id_param
    AND (status_filter IS NULL OR t.status = status_filter)
    AND (date_from IS NULL OR DATE(t.created_at) >= date_from)
    AND (date_to IS NULL OR DATE(t.created_at) <= date_to)
  ORDER BY t.created_at DESC
  LIMIT limit_param
  OFFSET offset_param;
END;
$$;
COMMENT ON FUNCTION search_trips_by_criteria IS 'Search trips with flexible filtering criteria';

-- Admin Functions
CREATE OR REPLACE FUNCTION admin_get_system_stats()
RETURNS JSONB
LANGUAGE plpgsql SECURITY DEFINER
AS $$
DECLARE
  stats JSONB;
BEGIN
  SELECT jsonb_build_object(
    'total_users', (SELECT COUNT(*) FROM profiles),
    'active_drivers', (SELECT COUNT(*) FROM profiles WHERE user_type = 'driver'),
    'total_trips', (SELECT COUNT(*) FROM trips),
    'total_vehicles', (SELECT COUNT(*) FROM vehicles),
    'pending_verifications', (SELECT COUNT(*) FROM verification_documents WHERE status = 'pending'),
    'today_stats', jsonb_build_object(
      'new_users', (SELECT COUNT(*) FROM profiles WHERE DATE(created_at) = CURRENT_DATE),
      'completed_trips', (SELECT COUNT(*) FROM trips WHERE DATE(created_at) = CURRENT_DATE AND status = 'completed'),
      'revenue', (SELECT COALESCE(SUM(fare_amount), 0) FROM trips WHERE DATE(created_at) = CURRENT_DATE AND status = 'completed')
    )
  ) INTO stats;
  
  RETURN stats;
END;
$$;
COMMENT ON FUNCTION admin_get_system_stats IS 'Get comprehensive system statistics for admin dashboard';

CREATE OR REPLACE FUNCTION admin_update_user_verification(
  user_id_param UUID,
  is_verified_param BOOLEAN,
  admin_notes TEXT DEFAULT NULL
)
RETURNS VOID
LANGUAGE plpgsql SECURITY DEFINER
AS $$
BEGIN
  UPDATE profiles 
  SET 
    is_verified = is_verified_param,
    updated_at = NOW()
  WHERE id = user_id_param;
  
  -- Log the verification change
  INSERT INTO verification_documents (
    user_id,
    document_type,
    status,
    admin_notes,
    created_at
  ) VALUES (
    user_id_param,
    'admin_verification',
    CASE WHEN is_verified_param THEN 'approved' ELSE 'rejected' END,
    admin_notes,
    NOW()
  );
END;
$$;
COMMENT ON FUNCTION admin_update_user_verification IS 'Update user verification status with admin notes';

-- Simple utility functions for testing basic types
CREATE OR REPLACE FUNCTION utility_validate_phone(phone_param TEXT)
RETURNS BOOLEAN
LANGUAGE plpgsql
AS $$
BEGIN
  RETURN phone_param ~ '^\+?[1-9]\d{1,14}$';
END;
$$;
COMMENT ON FUNCTION utility_validate_phone IS 'Validate phone number format';

CREATE OR REPLACE FUNCTION utility_generate_trip_code()
RETURNS TEXT
LANGUAGE plpgsql
AS $$
BEGIN
  RETURN UPPER(SUBSTRING(MD5(RANDOM()::TEXT), 1, 6));
END;
$$;
COMMENT ON FUNCTION utility_generate_trip_code IS 'Generate a unique 6-character trip code';

-- Void function for testing
CREATE OR REPLACE FUNCTION utility_cleanup_old_locations()
RETURNS VOID
LANGUAGE plpgsql SECURITY DEFINER
AS $$
BEGIN
  DELETE FROM driver_locations 
  WHERE updated_at < NOW() - INTERVAL '7 days';
END;
$$;
COMMENT ON FUNCTION utility_cleanup_old_locations IS 'Clean up old driver location records';

-- Grant necessary permissions
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA public TO authenticated;
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA public TO anon;