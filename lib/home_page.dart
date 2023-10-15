import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:reducer_sample/counter_reducer.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final CounterStore store = useReducer(
      reducer,
      initialState: const CounterState(),
      initialAction: CounterAction.reset,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('useReducer example'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Count: ${store.state.count}',
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () =>
                    store.dispatch(CounterAction.add),
                icon: const Icon(Icons.add),
              ),
              IconButton(
                onPressed: () =>
                    store.dispatch(CounterAction.minus),
                icon: const Icon(Icons.remove),
              ),
              IconButton(
                onPressed: () =>
                    store.dispatch(CounterAction.multiply),
                icon: const Icon(Icons.clear),
              ),
              IconButton(
                onPressed: () => store.dispatch(CounterAction.reset),
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
