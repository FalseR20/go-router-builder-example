import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_builder_example/builder_on/routes.dart';

class CommonScreen extends StatelessWidget {
  const CommonScreen({
    this.param,
    super.key,
  });

  final String? param;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(GoRouterState.of(context).uri.toString()),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          spacing: 16.0,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
              onPressed: () => const ExtraRoute('ExtraParam').go(context),
            ),
            OutlinedButton(
              child: const Text('Second branch / Path param route'),
              onPressed: () =>
                  const PathParamRoute(pathParam: 'PathParam').go(context),
            ),
            OutlinedButton(
              child: const Text('Second branch / Query param route'),
              onPressed: () =>
                  const QueryParamRoute(queryParam: 'QueryParam').go(context),
            ),
          ],
        ),
      ),
    );
  }
}
