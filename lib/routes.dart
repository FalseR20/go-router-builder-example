import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_builder_example/nav_bar.dart';
import 'package:go_router_builder_example/common_screen.dart';

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
      TypedGoRoute<ParamsRoute>(path: 'withParams'),
      TypedGoRoute<ExtraRoute>(path: 'withExtra'),
      TypedGoRoute<CombinedRoute>(path: 'combined'),
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
      const CommonScreen(title: 'HomeRoute');
}

class SimpleRoute extends GoRouteData {
  const SimpleRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const CommonScreen(title: 'SimpleRoute');
}

class SecondBranchRoute extends GoRouteData {
  const SecondBranchRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const CommonScreen(title: 'SecondBranchRoute');
}

class ParamsRoute extends GoRouteData {
  const ParamsRoute({required this.param});

  final String param;

  @override
  Widget build(BuildContext context, GoRouterState state) => CommonScreen(
        title: 'ParamsRoute',
        param: param,
      );
}

class ExtraRoute extends GoRouteData {
  const ExtraRoute(this.$extra);

  final Extra? $extra;

  @override
  Widget build(BuildContext context, GoRouterState state) => CommonScreen(
        title: 'ExtraRoute',
        extraArg: $extra?.arg,
      );
}

class Extra {
  const Extra({required this.arg});

  final String arg;
}

class CombinedRoute extends GoRouteData {
  const CombinedRoute(this.$extra, {required this.param});

  final Extra? $extra;
  final String param;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      CommonScreen(title: 'CombinedRoute', param: param, extraArg: $extra?.arg);
}
