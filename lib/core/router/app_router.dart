import 'package:air_high_quality_app/core/constants/app_constants.dart';
import 'package:air_high_quality_app/presentation/screens/dashboard/dashboard_screen.dart';
import 'package:air_high_quality_app/presentation/screens/device/device_screen.dart';
import 'package:air_high_quality_app/presentation/screens/graph/analytics_screen.dart';
import 'package:air_high_quality_app/presentation/screens/settings/settings_screen.dart';
import 'package:air_high_quality_app/presentation/screens/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppConstants.routeSplash,
    routes: [
      GoRoute(
        path: AppConstants.routeSplash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppConstants.routeDashboard,
        builder: (context, state) => const DashboardScreen(),
      ),
      GoRoute(
        path: AppConstants.routeAnalytics,
        builder: (context, state) => const AnalyticsScreen(),
      ),
      GoRoute(
        path: AppConstants.routeDevice,
        builder: (context, state) => DeviceScreen(),
      ),

      GoRoute(
        path: AppConstants.routeSettings,
        builder: (context, state) => SettingsScreen(),
      ),
    ],
  );
}
