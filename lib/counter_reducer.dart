import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

@immutable
class CounterState {
  const CounterState({required this.count});
  final int count;

  CounterState copyWith({int? count}) {
    return CounterState(count: count ?? this.count);
  }
}

sealed class CounterAction {}

class CounterInitializeAction implements CounterAction {}

class CounterIncrementAction implements CounterAction {}

class CounterDecrementAction implements CounterAction {}

class CounterMultiplyAction implements CounterAction {}

class CounterResetAction implements CounterAction {}

typedef CounterReducer = Reducer<CounterState, CounterAction>;

CounterReducer get reducer => (state, action) {
      return switch (action) {
        CounterInitializeAction() => state,
        CounterIncrementAction() => state.copyWith(count: state.count + 1),
        CounterDecrementAction() => state.copyWith(count: state.count - 1),
        CounterMultiplyAction() => state.copyWith(count: state.count * 2),
        CounterResetAction() => state.copyWith(count: 0),
      };
    };
