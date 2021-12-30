import 'package:flutter_best_practice/data/repository/jokes_repository.dart';
import 'package:flutter_best_practice/pages/riverpod/jokes_notifier.dart';
import 'package:flutter_best_practice/pages/riverpod/jokes_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final _jokesRepositoryProvider = Provider<IJokesRepository>(
  (ref) => JokesRepository(),
);

final jokesNotifierProvider = StateNotifierProvider<JokesNotifier, JokesState>(
  (ref) => JokesNotifier(
    jokesRepository: ref.watch(_jokesRepositoryProvider),
  ),
);
