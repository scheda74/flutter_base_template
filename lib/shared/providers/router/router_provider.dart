import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matomo_tracker/matomo_tracker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../features/home/home_screen.dart';
import '../../../features/public/landing_page_screen.dart';
import '../../../features/settings/settings_screen.dart';
import '../../utils/widgets/scaffold_with_nested_navigation.dart';

part 'router_provider.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> authNavigatorKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> homeNavigatorKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> settingsNavigatorKey = GlobalKey<NavigatorState>();

  // final authState = ref.watch(authStateProvider);

  return GoRouter(
    redirect: (context, state) {
      return null;
      // If our authentication is loading, don't perform redirects, yet
      // if (authState.isLoading) return null;

      // if (authState.valueOrNull == AuthState.needsReauthentication) {
      //   ref.read(authClientProvider).reauthenticate();
      //   return null;
      // }

      // final isPublicRoute = state.fullPath?.contains('public') ?? false;

      // if (!isPublicRoute &&
      //     (authState.hasError ||
      //         authState.valueOrNull == null ||
      //         authState.valueOrNull == AuthState.notAuthenticated)) {
      //   ref.read(authClientProvider).logout();
      //   return '/public/auth/login';
      // }

      // if (isPublicRoute && authState.valueOrNull == AuthState.authenticated) {
      //   return '/contracts';
      // }

      // if (authState.valueOrNull == AuthState.authenticated) {
      //   return null;
      // }

      // return null;
    },
    debugLogDiagnostics: true,
    navigatorKey: rootNavigatorKey,
    observers: [matomoObserver],
    initialLocation: '/home',
    routes: [
      ShellRoute(
        navigatorKey: authNavigatorKey,
        builder: (context, state, child) {
          return Placeholder(child: child);
        },
        routes: [
          GoRoute(
            path: '/',
            name: 'landingPage',
            builder: (context, state) => const LandingPageScreen(),
          ),
        ],
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            ScaffoldWithNestedNavigation(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            navigatorKey: homeNavigatorKey,
            routes: [
              GoRoute(
                path: '/home',
                name: 'home',
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: settingsNavigatorKey,
            routes: [
              GoRoute(
                path: '/settings',
                name: 'settings',
                builder: (context, state) => const SettingsScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
