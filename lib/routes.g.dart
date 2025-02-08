// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $myShellRoute,
    ];

RouteBase get $myShellRoute => StatefulShellRouteData.$route(
      factory: $MyShellRouteExtension._fromState,
      branches: [
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/',
              factory: $HomeRouteExtension._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'simple',
                  factory: $SimpleRouteExtension._fromState,
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/secondBranch',
              factory: $SecondBranchRouteExtension._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'withExtra',
                  factory: $ExtraRouteExtension._fromState,
                ),
                GoRouteData.$route(
                  path: 'withParams',
                  factory: $ParamsRouteExtension._fromState,
                ),
                GoRouteData.$route(
                  path: 'combined',
                  factory: $CombinedRouteExtension._fromState,
                ),
              ],
            ),
          ],
        ),
      ],
    );

extension $MyShellRouteExtension on MyShellRoute {
  static MyShellRoute _fromState(GoRouterState state) => const MyShellRoute();
}

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SimpleRouteExtension on SimpleRoute {
  static SimpleRoute _fromState(GoRouterState state) => const SimpleRoute();

  String get location => GoRouteData.$location(
        '/simple',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SecondBranchRouteExtension on SecondBranchRoute {
  static SecondBranchRoute _fromState(GoRouterState state) =>
      const SecondBranchRoute();

  String get location => GoRouteData.$location(
        '/secondBranch',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ExtraRouteExtension on ExtraRoute {
  static ExtraRoute _fromState(GoRouterState state) => ExtraRoute(
        state.extra as String?,
      );

  String get location => GoRouteData.$location(
        '/secondBranch/withExtra',
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}

extension $ParamsRouteExtension on ParamsRoute {
  static ParamsRoute _fromState(GoRouterState state) => ParamsRoute(
        param: state.uri.queryParameters['param']!,
      );

  String get location => GoRouteData.$location(
        '/secondBranch/withParams',
        queryParams: {
          'param': param,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $CombinedRouteExtension on CombinedRoute {
  static CombinedRoute _fromState(GoRouterState state) => CombinedRoute(
        param: state.uri.queryParameters['param']!,
        state.extra as String?,
      );

  String get location => GoRouteData.$location(
        '/secondBranch/combined',
        queryParams: {
          'param': param,
        },
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}
