import 'package:flutter_best_practice/data/repository/jokes_repository.dart';
import 'package:flutter_best_practice/pages/riverpod/jokes_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class JokesNotifier extends StateNotifier<JokesState> {
  final IJokesRepository _jokesRepository;
  JokesNotifier({required IJokesRepository jokesRepository})
      : _jokesRepository = jokesRepository,
        super(const JokesState.initial());
  getJoke() async {
    state = const JokesState.loading();
    try {
      final joke = await _jokesRepository.getJoke();
      state = JokesState.data(joke: joke);
    } catch (_) {
      state = const JokesState.error("Error!");
    }
  }
}
