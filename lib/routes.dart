import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_builder_example/nav_bar.dart';
import 'package:go_router_builder_example/screen.dart';

part 'routes.g.dart';

final router = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: kDebugMode,
  routes: $appRoutes,
);

@TypedStatefulShellRoute<MyShellRoute>(
  branches: [
    TypedStatefulShellBranch(routes: [
      TypedGoRoute<HomeRoute>(path: '/', routes: [
        TypedGoRoute<HomeInnerRoute>(path: 'inner'),
      ]),
    ]),
    TypedStatefulShellBranch(routes: [
      TypedGoRoute<Screen2Route>(path: '/screen2'),
    ]),
  ],
)
class MyShellRoute extends StatefulShellRouteData {
  const MyShellRoute();

  static final GlobalKey<NavigatorState> $navigatorKey =
      GlobalKey<NavigatorState>();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return NavBar(navigationShell: navigationShell);
  }
}

class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const Screen(title: 'Home');
}

class HomeInnerRoute extends GoRouteData {
  const HomeInnerRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const Screen(title: 'Home inner');
}

class Screen2Route extends GoRouteData {
  const Screen2Route();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const Screen(title: 'Screen 2');
}
