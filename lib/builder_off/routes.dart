import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_builder_example/builder_off/common_screen.dart';
import 'package:go_router_builder_example/builder_on/nav_bar.dart';

final router = GoRouter(debugLogDiagnostics: kDebugMode, routes: [
  StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          NavBar(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(routes: [
          GoRoute(
              path: '/',
              builder: (context, state) => const CommonScreen(),
              routes: [
                GoRoute(
                  path: 'simple',
                  builder: (context, state) => const CommonScreen(),
                ),
              ]),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
              path: '/secondBranch',
              builder: (context, state) => const CommonScreen(),
              routes: [
                GoRoute(
                  path: 'withExtra',
                  builder: (context, state) => CommonScreen(
                    param: state.extra as String?,
                  ),
                ),
                GoRoute(
                  path: 'withPathParam/:pathParam',
                  builder: (context, state) => CommonScreen(
                    param: state.pathParameters['pathParam'],
                  ),
                ),
                GoRoute(
                  path: 'withQueryParam',
                  builder: (context, state) => CommonScreen(
                    param: state.uri.queryParameters['queryParam'],
                  ),
                ),
              ]),
        ]),
      ]),
]);
