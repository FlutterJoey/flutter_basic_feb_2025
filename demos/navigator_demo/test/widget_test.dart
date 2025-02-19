import 'package:flutter_test/flutter_test.dart';

import 'package:navigator_demo/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    var found = find.text("View detail");

    await tester.tap(found);

    await tester.pumpAndSettle(Duration(seconds: 1));

    var back = find.text("Go back");

    await tester.tap(back);

    await tester.pumpAndSettle(Duration(seconds: 1));

    expect(found, findsOneWidget);
    expect(back, findsNothing);

    await tester.pumpAndSettle(Duration(seconds: 5));
  });
}
