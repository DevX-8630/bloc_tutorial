import 'package:bloc_tutorial_app/bloc/counter_bloc/counter_bloc.dart';
import 'package:bloc_tutorial_app/bloc/counter_bloc/counter_event.dart';
import 'package:bloc_tutorial_app/bloc/counter_bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Text(
                  state.counter.toString(),
                  style: const TextStyle(
                    fontSize: 70,
                    fontWeight: FontWeight.w400,
                  ),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<CounterBloc, CounterState>(
                  builder: (context, state) {
                    return TextButton(
                      onPressed: () {
                        context.read<CounterBloc>().add(DecrementCounter());
                      },
                      child: const Text(
                        '-',
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    );
                  },
                ),
                BlocBuilder<CounterBloc, CounterState>(
                  builder: (context, state) {
                    return TextButton(
                      onPressed: () {
                        context.read<CounterBloc>().add(IncrementCounter());
                      },
                      child: const Text(
                        '+',
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
