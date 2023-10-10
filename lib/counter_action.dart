import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter_action.freezed.dart';

@immutable
class CounterState {
  const CounterState({required this.count});
  final int count;

  CounterState copyWith({int? count}) {
    return CounterState(count: count ?? this.count);
  }
}

@freezed
sealed class CounterAction with _$CounterAction {
  const factory CounterAction.init() = Init;
  const factory CounterAction.increment() = Increment;
  const factory CounterAction.decrement() = Decrement;
  const factory CounterAction.multiply() = Multiply;
  const factory CounterAction.reset() = Reset;
}

CounterState reducer(CounterState state, CounterAction action) {
  return action.when(
    init: () => state,
    increment: () => state.copyWith(count: state.count + 1),
    decrement: () => state.copyWith(count: state.count - 1),
    multiply: () => state.copyWith(
      count: state.count * 2,
    ),
    reset: () => state.copyWith(count: 0),
  );
}
