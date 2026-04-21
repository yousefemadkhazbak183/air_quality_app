abstract final class AppConstants {
  // HTTP API
  static const String baseUrl = 'http://192.168.0.109';
  static const String sensorDataEndpoint = '/api/data';
  static const Duration pollingInterval = Duration(seconds: 2);

  // Supabase
  static const String supabaseUrl = 'https://kpmfqiwpkfxjncwtkakv.supabase.co';
  static const String supabaseAnonKey =
      'sb_publishable_ZrYKJ5UaM-lFJI38-cCDqw_QttWFy_b';
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
