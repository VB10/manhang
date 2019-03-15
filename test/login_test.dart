import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:manhang/screens/login.dart';

void main() {
  test('AssetImage from package', () {
    const AssetImage image = AssetImage(
      'assets/gif/stck.gif',
    );
    expect(image.keyName, 'assets/gif/stck.gif');
  });
}
