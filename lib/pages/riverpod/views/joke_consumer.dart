import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../jokes_provider.dart';

class JokeConsumer extends HookConsumerWidget {
  const JokeConsumer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(jokesNotifierProvider);
    return state.when(
      initial: () => const Text(
        'Press the button to start',
        textAlign: TextAlign.center,
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      data: (joke) => Text('${joke.setup}\n${joke.delivery}'),
      error: (error) => const Text('Error Occured!'),
    );
  }
}
