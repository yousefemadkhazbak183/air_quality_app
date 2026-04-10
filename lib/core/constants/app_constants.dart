abstract final class AppConstants {
  // Supabase
  static const String supabaseUrl = 'YOUR_SUPABASE_URL';
  static const String supabaseAnonKey = 'YOUR_SUPABASE_ANON_KEY';
  static const String sensorReadingsTable = 'sensor_readings';

  // Gas PPM thresholds
  static const double goodThresholdPpm = 400.0;
  static const double moderateThresholdPpm = 700.0;

  // History buffer
  static const int maxHistoricalReadings = 50;

  // Routes
  static const String routeSplash = '/';
  static const String routeDashboard = '/dashboard';
  static const String routeAnalytics = '/analytics';
  static const String routeDevice = '/device';
  static const String routeSettings = '/settings';

  // Alert
  static const Duration alertDismissDuration = Duration(seconds: 4);
  static const Duration splashDuration = Duration(milliseconds: 2500);
}
