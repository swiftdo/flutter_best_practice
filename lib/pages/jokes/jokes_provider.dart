import 'package:flutter_best_practice/data/repository/jokes_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'jokes_notifier.dart';
import 'jokes_state.dart';

final _jokesRepositoryProvider = Provider<IJokesRepository>(
  (ref) => JokesRepository(),
);

final jokesNotifierProvider = StateNotifierProvider<JokesNotifier, JokesState>(
  (ref) => JokesNotifier(
    jokesRepository: ref.watch(_jokesRepositoryProvider),
  ),
);
