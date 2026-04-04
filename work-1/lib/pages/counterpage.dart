import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {

  // variable
  int _counter = 0;

  // method

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  void _decrement() {
    setState(() {
      _counter--;
    });
  }
  //UI
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
      Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Counter"),
                Text(_counter.toString(),
                  style: TextStyle(fontSize: 30),
                ),
                ElevatedButton(onPressed: _increment, child:
                Text("Increment")
                ),
                ElevatedButton(onPressed: _decrement, child:
                Text("Decrement"),

                )
              ],
            ),
          ),
      )
    );
  }
}
