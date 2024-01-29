import 'package:byndco/features/home_feature/views/details_screen/details_screen.dart';
import 'package:byndco/features/home_feature/views/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/home_feature/views/splash_screen/splash_screen.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  static final route = GoRouter(
      navigatorKey: navigatorKey,
      debugLogDiagnostics: true,
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          name: SplashScreen.route,
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
            path: Home.route,
            name: Home.route,
            builder: (context, state) => const Home(),
            routes: [
              GoRoute(
                path: DetailsScreen.route,
                name: DetailsScreen.route,
                builder: (context, state) => const DetailsScreen(),
              ),
            ]),
      ]);
}
