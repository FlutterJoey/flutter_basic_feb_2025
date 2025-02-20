import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PicnicScreen(),
    );
  }
}

class PicnicScreen extends StatelessWidget {
  const PicnicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.shop), label: "test"),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle_outline_rounded),
            label: "list",
          ),
        ],
      ),
      backgroundColor: Colors.grey.shade100,
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          SizedBox(
            height: 36,
            child: ScreenTitle(),
          ),
          SizedBox(
            height: 36,
          ),
          SizedBox(
            height: 320,
            child: RecipeDeal(),
          ),
          SizedBox(height: 24),
          SizedBox(
            height: 320,
            child: AlwaysAffordable(),
          ),
        ],
      ),
    );
  }
}

class AlwaysAffordable extends StatelessWidget {
  const AlwaysAffordable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Altijd betaalbaar",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 12),
        Expanded(
          child: AffordableRecipeList(),
        ),
      ],
    );
  }
}

class AffordableRecipeList extends StatelessWidget {
  const AffordableRecipeList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        if (index == 0) {
          return SizedBox(width: 8);
        }
        return Container(
          height: 200,
          width: 220,
          margin: EdgeInsets.all(4),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "https://picsum.photos/seed/flutter$index/400/300"),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(alpha: 0.5),
                offset: Offset(1, 1),
                blurRadius: 1.0,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Spacer(),
              Container(
                height: 80,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(5),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Flutter $index",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "40 min | 4 personen",
                      style: TextStyle(
                        color: Colors.blueGrey.shade800,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class RecipeDeal extends StatelessWidget {
  const RecipeDeal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              "Voordeelrecept",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 12),
          Expanded(
            child: RecipeDealCard(),
          ),
        ],
      ),
    );
  }
}

class RecipeDealCard extends StatelessWidget {
  const RecipeDealCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage("https://picsum.photos/seed/fleur/400/300"),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.5),
            offset: Offset(1, 1),
            blurRadius: 1.0,
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(12),
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  "Voordeelrecept",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(10),
              ),
            ),
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 24,
                  child: Text(
                    "Traybake met kipdrummets",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "40 min | 4 personen",
                        style: TextStyle(
                          color: Colors.blueGrey.shade800,
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        child: Row(
                          spacing: 4,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "pp.",
                              style: TextStyle(
                                fontSize: 12,
                                height: 1,
                                color: Colors.blueGrey.shade600,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "1.⁵⁵",
                              style: TextStyle(
                                height: 1,
                                fontSize: 20,
                                color: Colors.blueGrey.shade600,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "1.⁴⁵",
                              style: TextStyle(
                                height: 1,
                                fontSize: 28,
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ScreenTitle extends StatelessWidget {
  const ScreenTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(
        left: 16,
      ),
      child: Text(
        "Koken met Picnic",
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
