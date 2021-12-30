import 'package:flutter/material.dart';
import 'package:flutter_best_practice/pages/riverpod/jokes_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../jokes_provider.dart';

class ButtonConsumer extends HookConsumerWidget {
  const ButtonConsumer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(jokesNotifierProvider);
    return ElevatedButton(
      child: const Text('Press me to get a joke'),
      onPressed: !state.isLoading
          ? () {
              ref.read(jokesNotifierProvider.notifier).getJoke();
            }
          : null,
    );
  }
}
