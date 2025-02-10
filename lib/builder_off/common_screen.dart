import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CommonScreen extends StatelessWidget {
  const CommonScreen({
    required this.title,
    this.param,
    super.key,
  });

  final String title;
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
            Text('Received parameter: ${json.encode(param)}'),
            const SizedBox(height: 8.0),
            FilledButton(
              child: const Text('Home branch'),
              onPressed: () => context.go('/'),
            ),
            OutlinedButton(
              child: const Text('Home branch / Simple route'),
              onPressed: () => context.go('/simple'),
            ),
            const SizedBox(height: 8.0),
            FilledButton(
              child: const Text('Second branch'),
              onPressed: () => context.go('/secondBranch'),
            ),
            OutlinedButton(
              child: const Text('Second branch / Extra route'),
              onPressed: () =>
                  context.go('/secondBranch/withExtra', extra: 'ExtraParam'),
            ),
            OutlinedButton(
              child: const Text('Second branch / Path params route'),
              onPressed: () =>
                  context.go('/secondBranch/withPathParam/${'PathParam'}'),
            ),
            OutlinedButton(
              child: const Text('Second branch / Query params route'),
              onPressed: () => context.go(Uri(
                path: '/secondBranch/withQueryParam',
                queryParameters: {'queryParam': 'QueryParam'},
              ).toString()),
            ),
          ],
        ),
      ),
    );
  }
}
