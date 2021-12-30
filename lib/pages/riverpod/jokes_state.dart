import 'package:flutter/foundation.dart';
import 'package:flutter_best_practice/data/model/joke_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'jokes_state.freezed.dart';

extension JokesGetters on JokesState {
  bool get isLoading => this is _JokesStateLoading;
}

@freezed
class JokesState with _$JokesState {
  const factory JokesState.initial() = _JokesStateInitial;

  const factory JokesState.loading() = _JokesStateLoading;

  const factory JokesState.data({required JokeModel joke}) = _JokesStateData;

  const factory JokesState.error([String? error]) = _JokesStateError;
}
