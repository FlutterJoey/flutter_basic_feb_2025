// import 'package:flutter/material.dart';

// class HorrorStoryApp extends StatelessWidget {
//   const HorrorStoryApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData.dark(),
//       home: BaseScreen(
//         title: "Character Selection",
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 80,
//                 width: double.infinity,
//                 child: MonsterAmountSelection(),
//               ),
//               const SizedBox(height: 24),
//               Expanded(
//                 child: CharacterSelection(),
//               ),
//               const SizedBox(height: 24),
//               FilledButton(
//                 onPressed: () {},
//                 child: Text("Start story"),
//               ),
//               const SizedBox(height: 40),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class CharacterSelection extends StatefulWidget {
//   const CharacterSelection({
//     super.key,
//   });

//   @override
//   State<CharacterSelection> createState() => _CharacterSelectionState();
// }

// List<String> possibleCharacters = [
//   "Joey",
//   "Thomas",
//   "Nick",
//   "Lasse",
//   "Martijn",
//   "Fleur"
// ];

// class _CharacterSelectionState extends State<CharacterSelection> {
//   List<String> characters = [];

//   void addCharacter(String character) {
//     setState(() {
//       characters.add(character);
//     });
//   }

//   void removeCharacter(int index) {
//     setState(() {
//       characters.removeAt(index);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: characters.length + 1,
//       itemBuilder: (context, index) {
//         if (index == characters.length) {
//           return Center(
//             child: IconButton.filled(
//                 onPressed: () {
//                   addCharacter(
//                       possibleCharacters[index % possibleCharacters.length]);
//                 },
//                 icon: Icon(Icons.add)),
//           );
//         }
//         return ListTile(
//           title: Text("Character id: ${characters[index]}"),
//           trailing: IconButton(
//             onPressed: () {
//               removeCharacter(index);
//             },
//             icon: Icon(Icons.delete),
//           ),
//         );
//       },
//     );
//   }
// }

// class MonsterAmountSelection extends StatefulWidget {
//   const MonsterAmountSelection({
//     super.key,
//   });

//   @override
//   State<MonsterAmountSelection> createState() => _MonsterAmountSelectionState();
// }

// class _MonsterAmountSelectionState extends State<MonsterAmountSelection> {
//   int monsterCount = 2;

//   void increaseMonsterCount() {
//     setState(() {
//       monsterCount += 1;
//     });
//   }

//   void decreaseMonsterCount() {
//     if (monsterCount < 1) return;

//     setState(() {
//       monsterCount -= 1;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Row(
//           children: [
//             Expanded(
//               child: Text("Monsters"),
//             ),
//             Row(
//               children: [
//                 IconButton(
//                   onPressed: decreaseMonsterCount,
//                   icon: Icon(Icons.remove),
//                 ),
//                 Text("$monsterCount"),
//                 IconButton(
//                   onPressed: increaseMonsterCount,
//                   icon: Icon(Icons.add),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class BaseScreen extends StatelessWidget {
//   const BaseScreen({
//     required this.title,
//     required this.child,
//     super.key,
//   });

//   final Widget child;
//   final String title;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(title),
//       ),
//       body: child,
//     );
//   }
// }
