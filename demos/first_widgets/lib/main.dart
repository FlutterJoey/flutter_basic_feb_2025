import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyScreen(),
    );
  }
}

class MyScreen extends StatelessWidget {
  const MyScreen({
    super.key,
  });

  final String name = "Joey";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Our first app"),
      ),
      drawer: Drawer(),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Counter(),
          ),
          Center(
            child: TitleText(
              text: "Hello World",
            ),
          ),
          UpperLeftWithName(name: name),
          Center(
            child: SizedBox(
              height: 200,
              width: 200,
              child: UpperLeftWithName(name: "Martijn"),
            ),
          ),
        ],
      ),
    );
  }
}

class UpperLeftWithName extends StatelessWidget {
  const UpperLeftWithName({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: TitleText(
        text: "Upper left $name",
      ),
    );
  }
}

class TitleText extends StatelessWidget {
  const TitleText({
    required this.text,
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() {
    return _CounterState();
  }
}

class _CounterState extends State<Counter> {
  int total = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Totaal: $total"),
        FilledButton(
          onPressed: () {
            setState(() {
              total = total + 1;
            });

            if (total > 10) {
              var scaffold = Scaffold.maybeOf(context);
              if (scaffold != null) {
                scaffold.openDrawer();
              }
            }
            if (total == 10) {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Counter()));
            }
          },
          child: Text("Increment"),
        ),
      ],
    );
  }
}
