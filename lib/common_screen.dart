import 'package:flutter/material.dart';
import 'package:go_router_builder_example/routes.dart';

class CommonScreen extends StatelessWidget {
  const CommonScreen({
    required this.title,
    this.param,
    this.extraArg,
    super.key,
  });

  final String title;
  final String? param;
  final String? extraArg;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 16.0,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Received parameter: $param'),
            Text('Received extra argument: $extraArg'),
            const Text(
              'Navigation',
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              child: const Text('Go to home route'),
              onPressed: () => const HomeRoute().go(context),
            ),
            OutlinedButton(
              child: const Text('Go to simple route'),
              onPressed: () => const SimpleRoute().go(context),
            ),
            ElevatedButton(
              child: const Text('Go to second branch route'),
              onPressed: () => const SecondBranchRoute().go(context),
            ),
            OutlinedButton(
              child: const Text('Go to params route'),
              onPressed: () => const ParamsRoute(param: 'Param').go(context),
            ),
            OutlinedButton(
              child: const Text('Go to extra route'),
              onPressed: () =>
                  const ExtraRoute(Extra(arg: 'Extra')).go(context),
            ),
            OutlinedButton(
              child: const Text('Go to combined route'),
              onPressed: () =>
                  const CombinedRoute(Extra(arg: 'Extra'), param: 'Param')
                      .go(context),
            ),
          ],
        ),
      ),
    );
  }
}
