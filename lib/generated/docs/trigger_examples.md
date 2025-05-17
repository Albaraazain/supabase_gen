# Trigger Function Examples in Generated Models

This document shows examples of how trigger functions are documented in generated model files.

## Example Model with Triggers

```dart
// This is an example of a generated model file showing trigger documentation

import 'dart:convert';
import 'package:supabase_gen/utils/geo_json.dart';

/// Represents a user_profile in the database
///
/// Columns:
/// - id: The unique identifier (UUID)
/// - user_id: Foreign key to the auth.users table (UUID)
/// - display_name: User's display name (text)
/// - bio: User's bio (text)
/// - avatar_url: URL to user's avatar image (text)
/// - created_at: When the profile was created (timestamp)
/// - updated_at: When the profile was last updated (timestamp)
///
/// Database triggers associated with this table:
/// - update_profile_timestamp: UPDATE BEFORE - EXECUTE FUNCTION update_timestamp()
///   Signature: update_timestamp() RETURNS trigger
///   Language: plpgsql
///   Description: Updates the modified_at timestamp automatically
///   Body: BEGIN NEW.updated_at = now(); RETURN NEW; END;
/// 
/// - log_profile_changes: INSERT, UPDATE, DELETE AFTER - EXECUTE FUNCTION log_profile_history()
///   Signature: log_profile_history() RETURNS trigger
///   Language: plpgsql
///   Body: BEGIN IF TG_OP = 'DELETE' THEN INSERT INTO profile_history(profile_id, action, data, changed_at) 
///         VALUES(OLD.id, TG_OP, to_jsonb(OLD), now()); ELSE INSERT INTO profile_history(profile_id, action, data, changed_at)
///         VALUES(NEW.id, TG_OP, to_jsonb(NEW), now()); END IF; RETURN NULL; END;
class UserProfile {
  final String id;
  final String userId;
  final String? displayName;
  final String? bio;
  final String? avatarUrl;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserProfile({
    required this.id,
    required this.userId,
    this.displayName,
    this.bio,
    this.avatarUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  // Serialization methods...
}
```

## Example Repository with Trigger Documentation

```dart
// This is an example of a generated repository file with trigger information

import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/user_profile_model.dart';

/// Repository for UserProfile table operations
///
/// This repository provides CRUD operations for the user_profiles table
///
/// Database triggers on this table:
/// - update_profile_timestamp: UPDATE BEFORE - EXECUTE FUNCTION update_timestamp()
///   Function will automatically update the 'updated_at' field to current timestamp
///   on any update operations.
///
/// - log_profile_changes: INSERT, UPDATE, DELETE AFTER - EXECUTE FUNCTION log_profile_history()
///   Function will record all changes to the profile_history table for audit purposes.
class UserProfileRepository {
  final SupabaseClient _client;
  
  UserProfileRepository(this._client);
  
  // Repository methods...
}
```

## Impact on Application Code

When using models with triggers, your application code should be aware of the automatic side effects:

```dart
// Example application code working with triggered fields

final profileRepository = UserProfileRepository(supabase);

// Creating a profile - created_at and updated_at will be set by database default values
await profileRepository.create(
  userId: currentUser.id,
  displayName: 'New User',
  bio: 'Hello world!',
);

// Updating a profile - updated_at will be automatically updated by the trigger
// You don't need to provide updated_at in your code
await profileRepository.update(
  id: profileId,
  displayName: 'Updated Name',
  // Notice that updated_at is not provided here - the trigger handles it
);

// When reading the profile history, you'll see entries created by the log_profile_changes trigger
final history = await supabase
  .from('profile_history')
  .select()
  .eq('profile_id', profileId)
  .order('changed_at', ascending: false);
```

## Benefits of Detailed Trigger Documentation

Having the full trigger function body in your code documentation provides several benefits:

1. **Understanding Side Effects**: Developers can see exactly what happens when data changes
2. **Self-documenting Code**: No need to check the database to understand automatic behaviors
3. **Debugging Aid**: Helps troubleshoot unexpected data changes
4. **Maintainability**: Makes it clear which fields are managed by the database