import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

@immutable
class State {
  const State({this.counter = 0});
  final int counter;
}

// create the actions you wish to dispatch to the reducer
// reducerに送りたいアクションを作成する
class IncrementCounter {
  IncrementCounter({required this.counter});
  final int counter;
}

sealed class CounterAction {}



class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // create the reducer function that will handle the actions you dispatch
    // 送るアクションを扱うreducer関数を作成する
    State reducer(State state, IncrementCounter? action) {
      if (action is IncrementCounter) {
        // stateの古い値 + actionのcounterを足す
        return State(counter: state.counter + action.counter);
      }
      return state;
    }

    // Next, invoke the 'useReducer' function with the reducer function and initial state to create a
    // '_store' variable that contains the current state and dispatch. Whenever the value is
    // changed, this Widget will be rebuilt!
    // 次に `useReducer` 関数に reducer 関数と初期状態を指定して呼び出すと、現在の状態とディスパッチが格納された `_store` 変数が作成されます。
    // 値が変更されるたびに、このWidgetは再構築されます！
    final store = useReducer(
      reducer,
      initialState: const State(),
      initialAction: IncrementCounter(counter: 0),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('useReducer example'),
      ),
      body: Center(
        // read the current value from the counter
        // counterの現在の値を読み取る
        child: Text('Button tapped ${store.state.counter} times'),
      ),
      floatingActionButton: FloatingActionButton(
        // when the button is pressed, dispatch the action you wish to trigger!
        // This will trigger a rebuild, displaying the latest value in the Text Widget Above.
        // ボタンが押されたときに、トリガーするアクションをディスパッチします！
        // これにより、上記のテキストウィジェットに最新の値が表示されるようになります。
        // 要は、ディスパッチすると、reducer関数が呼ばれて、stateが更新される、そして、Widgetが再構築される
        onPressed: () => store.dispatch(IncrementCounter(counter: 1)),
        child: const Icon(Icons.add),
      ),
    );
  }
}
