# Job Broadcast Implementation Plan

## Overview
This plan outlines the steps to create job broadcast requests from khatabi@gmail.com that will be visible to ahmed2@gmail.com. The end goal is to have:
- 1 active job for ahmed2@gmail.com
- 2 broadcast jobs from khatabi@gmail.com visible to ahmed2@gmail.com

## Implementation Flow

```mermaid
graph TD
    A[Start] --> B[Get User IDs]
    B --> C[Get Service Categories]
    C --> D[Create Active Job]
    D --> E[Create Broadcast Jobs]
    
    subgraph "1. User Identification"
        B1[Query auth.users for khatabi@gmail.com] --> B2[Query auth.users for ahmed2@gmail.com]
        B2 --> B3[Verify user roles in profiles tables]
    end
    
    subgraph "2. Service Categories"
        C1[Query service_categories table] --> C2[Select categories for broadcasts]
        C2 --> C3[Verify ahmed2@gmail.com's service offerings]
    end
    
    subgraph "3. Active Job Creation"
        D1[Create job record] --> D2[Set status as 'active']
        D2 --> D3[Link to selected service category]
        D3 --> D4[Set location and budget details]
    end
    
    subgraph "4. Broadcast Jobs Creation"
        E1[Create first broadcast] --> E2[Create second broadcast]
        E2 --> E3[Set broadcast radius and expiry]
        E3 --> E4[Verify broadcasts are visible to ahmed2@gmail.com]
    end
```

## Detailed Steps

### 1. Database Investigation

#### User Identification
```sql
-- Get User IDs
SELECT * FROM auth.users WHERE email IN ('khatabi@gmail.com', 'ahmed2@gmail.com');

-- Verify Profiles
SELECT * FROM homeowner_profiles WHERE user_id = :khatabi_id;
SELECT * FROM professional_profiles WHERE user_id = :ahmed2_id;
```

#### Service Categories
```sql
-- Get available service categories
SELECT * FROM service_categories;
```

### 2. Active Job Creation

Required fields:
- homeowner_id (from khatabi@gmail.com)
- service_id
- title
- description
- location details
- budget range
- status = 'active'

```sql
INSERT INTO jobs (
    homeowner_id,
    service_id,
    title,
    description,
    location_address,
    location_lat,
    location_lng,
    budget_range_min,
    budget_range_max,
    status
) VALUES (
    :homeowner_id,
    :service_id,
    :title,
    :description,
    :location_address,
    :location_lat,
    :location_lng,
    :budget_min,
    :budget_max,
    'active'
);
```

### 3. Broadcast Jobs Creation

Required fields for each broadcast:
- homeowner_id (from khatabi@gmail.com)
- service_id (different for each broadcast)
- title
- description
- location details
- budget range
- broadcast_radius
- expiry_time
- status = 'broadcast'

```sql
INSERT INTO job_broadcasts (
    broadcast_id,
    homeowner_id,
    service_id,
    title,
    description,
    location_address,
    location_lat,
    location_lng,
    urgency_level,
    preferred_schedule,
    budget_range_min,
    budget_range_max,
    broadcast_radius,
    status,
    expiry_time
) VALUES (
    gen_random_uuid(),
    :homeowner_id,
    :service_id,
    :title,
    :description,
    :location_address,
    :location_lat,
    :location_lng,
    :urgency_level,
    :preferred_schedule,
    :budget_min,
    :budget_max,
    :broadcast_radius,
    'broadcast',
    NOW() + interval '7 days'
);
```

### 4. Verification Queries

```sql
-- Check active job
SELECT * FROM jobs 
WHERE professional_id = :ahmed2_id 
AND status = 'active';

-- Check broadcast jobs
SELECT * FROM job_broadcasts 
WHERE broadcast_radius >= 
    ST_Distance(
        location_point, 
        (SELECT location_point FROM professional_profiles WHERE user_id = :ahmed2_id)
    )
AND status = 'broadcast'
AND homeowner_id = :khatabi_id;
```

## Next Steps

1. Review and approve the SQL operations
2. Switch to code mode for implementation
3. Execute the operations in the following order:
   - User verification
   - Service category selection
   - Active job creation
   - Broadcast jobs creation
   - Final verification
4. Document any issues or adjustments needed during implementation