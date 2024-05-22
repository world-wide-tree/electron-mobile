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

// final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
// final GlobalKey<NavigatorState> _shellNavigatorKey =
//     GlobalKey<NavigatorState>();

// final GoRouter router = GoRouter(
//   navigatorKey: _rootNavigatorKey,
//   initialLocation: '/',
//   routes: [
//     GoRoute(
//       path: '/',
//       builder: (context, state) {
//         return const LoginScreen();
//       },
//     ),
//     GoRoute(
//       path: '/login_with_number',
//       builder: (context, state) {
//         return const LoginWithNumberScreen();
//       },
//     ),
//     GoRoute(
//       path: '/verify_screen',
//       builder: (context, state) {
//         return const VerifyScreen();
//       },
//     ),
//     ShellRoute(
//       parentNavigatorKey: _rootNavigatorKey,
//       navigatorKey: _shellNavigatorKey,
//       builder: (context, state, child) {
//         return RootScreen(child: child);
//       },
//       routes: [
//         GoRoute(
//           path: '/dashboard',
//           builder: (context, state) {
//             return const DashboardScreen();
//           },
//           // routes: <RouteBase>[
//           //   GoRoute(
//           //     path: 'details',
//           //     builder: (BuildContext context, GoRouterState state) {
//           //       return Container();
//           //     },
//           //   ),
//           // ],
//         ),
//         GoRoute(
//           path: '/rooms',
//           builder: (context, state) {
//             return const RoomsScreen();
//           },
//           // routes: <RouteBase>[
//           //   GoRoute(
//           //     path: 'details',
//           //     parentNavigatorKey: _rootNavigatorKey,
//           //     builder: (BuildContext context, GoRouterState state) {
//           //       return Container();
//           //     },
//           //   ),
//           // ],
//         ),
//         GoRoute(
//           path: '/devices',
//           builder: (BuildContext context, GoRouterState state) {
//             return const DevicesScreen();
//           },
//           // routes: <RouteBase>[
//           //   GoRoute(
//           //     path: 'details',
//           //     parentNavigatorKey: _rootNavigatorKey,
//           //     builder: (BuildContext context, GoRouterState state) {
//           //       return Container();
//           //     },
//           //   ),
//           // ],
//         ),
//       ],
//     ),
//     // GoRoute(path: )
//   ],
// );

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

      // pageBuilder: (context, state) => NoTransitionPage<void>(
      //   child: DetailsScreen(),
      // ),
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
            // top route inside branch
            GoRoute(
              path: '/dashboard',
              pageBuilder: (context, state) => const NoTransitionPage<void>(
                child: DashboardScreen(),
              ),
              // routes: [
              //   GoRoute(
              //     path: 'details',
              //     builder: (context, state) => const DetailsScreen(label: 'A'),
              //   ),
              // ],
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
              // routes: [
              //   GoRoute(
              //     path: 'details',
              //     builder: (context, state) => const DetailsScreen(label: 'B'),
              //   ),
              // ],
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
              // routes: [
              //   GoRoute(
              //     path: 'details',
              //     builder: (context, state) => const DetailsScreen(label: 'B'),
              //   ),
              // ],
            ),
          ],
        ),
      ],
    ),
  ],
);
