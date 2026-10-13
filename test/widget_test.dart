import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:taskkk/main.dart';

void main() {
  testWidgets('app starts', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
