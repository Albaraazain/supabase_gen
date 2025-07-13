/// Timezone utilities for consistent timestamp handling
/// 
/// All database timestamps should be stored in UTC to avoid timezone issues
/// between client and server, and when users are in different timezones.
class AppTime {
  /// Get current time in UTC for database storage
  /// Use this instead of DateTime.now() for all database timestamps
  static DateTime nowUtc() => DateTime.now().toUtc();
  
  /// Get current time in local timezone for UI display
  static DateTime nowLocal() => DateTime.now();
  
  /// Convert a UTC timestamp from database to local time for display
  /// Use this when showing timestamps to users
  static DateTime toLocal(DateTime? utcTime) => 
    utcTime?.toLocal() ?? DateTime.now();
  
  /// Convert local time input to UTC for database storage
  /// Use this when user provides a datetime input
  static DateTime toUtc(DateTime localTime) => localTime.toUtc();
  
  /// Parse a timestamp string from database (already in UTC)
  /// and convert to local time for display
  static DateTime? parseUtcToLocal(String? timestampStr) {
    if (timestampStr == null) return null;
    try {
      final utcTime = DateTime.parse(timestampStr);
      return utcTime.toLocal();
    } catch (e) {
      return null;
    }
  }
}
