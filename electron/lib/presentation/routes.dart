import 'package:electron/presentation/screens/dashboard/dashboard_screen.dart';
import 'package:electron/presentation/screens/dashboard/details.dart';
import 'package:electron/presentation/screens/devices/devices_screen.dart';
import 'package:electron/presentation/screens/login/login_screen.dart';
import 'package:electron/presentation/screens/login_with_number/login_with_number.dart';
import 'package:electron/presentation/screens/rooms/rooms_screen.dart';
import 'package:electron/presentation/screens/root.dart';
import 'package:electron/presentation/screens/verify/verify_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorDashboardKey =
    GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorRoomsdKey =
    GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorDevicesKey =
    GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const LoginScreen();
      },
    ),
    GoRoute(
      path: '/login_with_number',
      builder: (context, state) {
        return LoginWithNumberScreen();
      },
    ),
    GoRoute(
      path: '/verify_screen',
      builder: (context, state) {
        return const VerifyScreen();
      },
    ),
    GoRoute(
      path: '/dashboard/details',
      builder: (context, state) => const DetailsScreen(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return RootScreen(
          navigationShell: navigationShell,
        );
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorDashboardKey,
          routes: [
            GoRoute(
              path: '/dashboard',
              pageBuilder: (context, state) => const NoTransitionPage<void>(
                child: DashboardScreen(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorRoomsdKey,
          routes: [
            GoRoute(
              path: '/rooms',
              pageBuilder: (context, state) => const NoTransitionPage<void>(
                child: RoomsScreen(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorDevicesKey,
          routes: [
            GoRoute(
              path: '/devices',
              pageBuilder: (context, state) =>  NoTransitionPage<void>(
                child: DevicesScreen(rooms: ['Room1', 'Room2', 'Room3'],),
              ),
            ),
          ],
        ),
      ],
    ),
  ],
);
