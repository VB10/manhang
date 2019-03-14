import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:manhang/screens/login.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(LoginPage());
    // Tap the '+' icon and trigger a frame.
    expect(find.byIcon(Icons.inbox), findsOneWidget);
  });
  test('AssetImage from package', () {
    const AssetImage image = AssetImage(
      'assets/gif/stck.gif',
    );
    expect(image.keyName, 'assets/gif/stck.gif');
  });
}
