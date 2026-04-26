import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/screens/main_screen.dart';
import '../../presentation/screens/splash/splash_screen.dart';
import '../constants/app_constants.dart';

abstract final class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppConstants.routeSplash,
    routes: [
      GoRoute(
        path: AppConstants.routeSplash,
        builder: (BuildContext context, GoRouterState state) =>
            const SplashScreen(),
      ),
      GoRoute(
        path: AppConstants.routeDashboard,
        builder: (BuildContext context, GoRouterState state) =>
            const MainScreen(),
      ),
    ],
  );
}
