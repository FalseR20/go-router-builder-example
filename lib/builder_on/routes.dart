import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_builder_example/builder_on/nav_bar.dart';
import 'package:go_router_builder_example/builder_on/common_screen.dart';

part 'routes.g.dart';

final router = GoRouter(
  debugLogDiagnostics: kDebugMode,
  routes: $appRoutes,
);

@TypedStatefulShellRoute<MyShellRoute>(branches: [
  TypedStatefulShellBranch(routes: [
    TypedGoRoute<HomeRoute>(path: '/', routes: [
      TypedGoRoute<SimpleRoute>(path: 'simple'),
    ]),
  ]),
  TypedStatefulShellBranch(routes: [
    TypedGoRoute<SecondBranchRoute>(path: '/secondBranch', routes: [
      TypedGoRoute<ExtraRoute>(path: 'withExtra'),
      TypedGoRoute<PathParamRoute>(path: 'withPathParams/:pathParam'),
      TypedGoRoute<QueryParamRoute>(path: 'withQueryParam'),
    ]),
  ]),
])
class MyShellRoute extends StatefulShellRouteData {
  const MyShellRoute();

  static final GlobalKey<NavigatorState> $navigatorKey =
      GlobalKey<NavigatorState>();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) =>
      NavBar(navigationShell: navigationShell);
}

class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const CommonScreen();
}

class SimpleRoute extends GoRouteData {
  const SimpleRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const CommonScreen();
}

class SecondBranchRoute extends GoRouteData {
  const SecondBranchRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const CommonScreen();
}

class ExtraRoute extends GoRouteData {
  const ExtraRoute(this.$extra);

  final String? $extra;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      CommonScreen(param: $extra);
}

class PathParamRoute extends GoRouteData {
  const PathParamRoute({required this.pathParam});

  final String pathParam;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      CommonScreen(param: pathParam);
}

class QueryParamRoute extends GoRouteData {
  const QueryParamRoute({required this.queryParam});

  final String queryParam;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      CommonScreen(param: queryParam);
}
