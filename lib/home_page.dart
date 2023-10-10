import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:reducer_sample/counter_action.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final store = useReducer(
      reducer,
      initialState: const CounterState(count: 0),
      initialAction: const CounterAction.init(),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('useReducer example'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Button tapped ${store.state.count} times',
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () =>
                    store.dispatch(const CounterAction.increment()),
                icon: const Icon(Icons.add),
              ),
              IconButton(
                onPressed: () =>
                    store.dispatch(const CounterAction.decrement()),
                icon: const Icon(Icons.remove),
              ),
              IconButton(
                onPressed: () =>
                    store.dispatch(const CounterAction.multiply()),
                icon: const Icon(Icons.clear),
              ),
              IconButton(
                onPressed: () => store.dispatch(const CounterAction.reset()),
                icon: const Icon(
                  Icons.refresh,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
