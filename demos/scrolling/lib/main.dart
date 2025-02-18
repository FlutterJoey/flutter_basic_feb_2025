import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: GridViewScreen(),
    );
  }
}

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({super.key});

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  late ScrollController controller;

  @override
  void initState() {
    super.initState();
    controller = ScrollController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: FilledButton(
              onPressed: () {
                controller.animateTo(
                  200,
                  duration: Duration(seconds: 2),
                  curve: Curves.easeIn,
                );
              },
              child: Text("Jump to"),
            ),
          ),
          Expanded(
            flex: 15,
            child: ScrollbarTheme(
              data: ScrollbarThemeData(
                thumbVisibility: WidgetStatePropertyAll(true),
                thickness: WidgetStatePropertyAll(20),
              ),
              child: ListView.builder(
                itemCount: 200,
                controller: controller,
                itemBuilder: (context, index) {
                  if (index.isEven) {
                    return ListViewItem(
                      index: index,
                    );
                  }
                  return Container(
                    color: Colors.blue,
                    height: 200,
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text("$index"),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ListViewItem extends StatefulWidget {
  const ListViewItem({
    required this.index,
    super.key,
  });

  final int index;

  @override
  State<ListViewItem> createState() => _ListViewItemState();
}

class _ListViewItemState extends State<ListViewItem> {
  double opacity = 1.0;

  @override
  void initState() {
    super.initState();
    print("${widget.index} created");
  }

  @override
  void dispose() {
    print("${widget.index} disposed");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          opacity -= 0.1;
          opacity = opacity.clamp(0, 1);
        });
      },
      child: Opacity(
        opacity: opacity,
        child: Container(
          color: Colors.red,
          height: 200,
          width: double.infinity,
          alignment: Alignment.center,
          child: Text("${widget.index}"),
        ),
      ),
    );
  }
}

class SingleChildScrollViewScreen extends StatelessWidget {
  const SingleChildScrollViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Text("Hello World"),
            FlutterLogo(
              size: 160,
            ),
            Container(
              key: ValueKey("container_a"),
              color: Colors.red,
              height: 200,
              width: 200,
              alignment: Alignment.center,
              child: Text("Container"),
            ),
            Container(
              key: ValueKey("container_b"),
              color: Colors.blue,
              height: 200,
              width: 200,
              alignment: Alignment.center,
              child: Text("Container"),
            ),
            Container(
              key: ValueKey("container_c"),
              color: Colors.red,
              height: 200,
              width: 200,
              alignment: Alignment.center,
              child: Text("Container"),
            ),
          ],
        ),
      ),
    );
  }
}

class GridViewScreen extends StatelessWidget {
  const GridViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var itemCount = 4;
    if (mediaQuery.size.width > 800) {
      itemCount = 5;
    }

    return BaseScreen(
      child: GridView.count(
        crossAxisCount: itemCount,
        padding: EdgeInsets.all(20),
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 1 / 3,
        children: List.generate(200, (_) => Placeholder()),
      ),
    );
  }
}

class BaseScreen extends StatelessWidget {
  const BaseScreen({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
    );
  }
}
