import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

@immutable
class CounterState {
  const CounterState({this.count = 0});
  final int count;

  CounterState copyWith({int? count}) {
    return CounterState(count: count ?? this.count);
  }
}

sealed class CounterAction {}

class CounterIncrementAction implements CounterAction {
  const CounterIncrementAction();
}

class CounterDecrementAction implements CounterAction {
  const CounterDecrementAction();
}

class CounterMultiplyAction implements CounterAction {
  const CounterMultiplyAction();
}

class CounterResetAction implements CounterAction {
  const CounterResetAction();
}

typedef CounterStore = Store<CounterState, CounterAction>;
typedef CounterReducer = Reducer<CounterState, CounterAction>;
CounterReducer get reducer => (state, action) {
      return switch (action) {
        CounterIncrementAction() => state.copyWith(count: state.count + 1),
        CounterDecrementAction() => state.copyWith(count: state.count - 1),
        CounterMultiplyAction() => state.copyWith(count: state.count * 2),
        CounterResetAction() => state.copyWith(count: 0),
      };
    };
