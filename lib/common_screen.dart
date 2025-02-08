import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_builder_example/routes.dart';

class CommonScreen extends StatelessWidget {
  const CommonScreen({
    required this.title,
    this.extra,
    this.param,
    super.key,
  });

  final String title;
  final String? extra;
  final String? param;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          spacing: 16.0,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Current location: ${GoRouterState.of(context).uri}'),
            Text('Received extra argument: ${json.encode(extra)}'),
            Text('Received parameter: ${json.encode(param)}'),
            const SizedBox(height: 8.0),
            FilledButton(
              child: const Text('Home branch'),
              onPressed: () => const HomeRoute().go(context),
            ),
            OutlinedButton(
              child: const Text('Home branch / Simple route'),
              onPressed: () => const SimpleRoute().go(context),
            ),
            const SizedBox(height: 8.0),
            FilledButton(
              child: const Text('Second branch'),
              onPressed: () => const SecondBranchRoute().go(context),
            ),
            OutlinedButton(
              child: const Text('Second branch / Extra route'),
              onPressed: () => const ExtraRoute('Extra').go(context),
            ),
            OutlinedButton(
              child: const Text('Second branch / Params route'),
              onPressed: () => const ParamsRoute(param: 'Param').go(context),
            ),
            OutlinedButton(
              child: const Text('Second branch / Combined route'),
              onPressed: () =>
                  const CombinedRoute('Extra', param: 'Param').go(context),
            ),
          ],
        ),
      ),
    );
  }
}
