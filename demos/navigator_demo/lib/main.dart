import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(
            onPressed: () async {
              print("Showing");

              var result = await Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return DetailScreen(
                    userId: "3",
                  );
                }),
              );

              print("Hello, $result");
            },
            icon: Icon(Icons.menu),
          ),
        ],
      ),
      body: Placeholder(
        child: Center(
          child: FilledButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return DetailScreen(
                    userId: "2",
                  );
                }),
              );
            },
            child: Text("View detail"),
          ),
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    required this.userId,
    super.key,
  });

  final String userId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Detail voor $userId"),
      ),
      body: Placeholder(
        child: Center(
          child: Column(
            children: [
              FilledButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) {
                      return HomeScreen();
                    }),
                  );
                },
                child: Text("Replace"),
              ),
              SizedBox(height: 20),
              FilledButton(
                onPressed: () {
                  Navigator.of(context).pop("Joey");
                },
                child: Text("Go back"),
              ),
              SizedBox(height: 20),
              FilledButton(
                onPressed: () async {
                  Future.delayed(
                    Duration(seconds: 5),
                    () {
                      if (context.mounted) {
                        Navigator.of(context).pop();
                      }
                    },
                  );
                  print("Wait until user gives an answer");
                  var result = await showDialog<String>(
                    context: context,
                    builder: (context) {
                      return BackDialog();
                    },
                  );
                  print("user gave answer: $result");
                  if (result == null) return;

                  if (result == "yes") {
                    if (context.mounted) {
                      Navigator.of(context).pop();
                    }
                  }
                },
                child: Text("Show dialog"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BackDialog extends StatelessWidget {
  const BackDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 200,
          maxHeight: 200,
        ),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Do you want to go back"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop("yes");
                      },
                      icon: Icon(Icons.check),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop("no");
                      },
                      icon: Icon(Icons.remove),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
