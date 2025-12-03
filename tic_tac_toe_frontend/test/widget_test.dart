import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tic_tac_toe_frontend/main.dart';

void main() {
  testWidgets('App displays Tic Tac Toe layout', (WidgetTester tester) async {
    await tester.pumpWidget(const TicTacToeApp());

    // App bar title
    expect(find.text('Tic Tac Toe'), findsOneWidget);

    // Reset button exists
    expect(find.byIcon(Icons.restart_alt), findsOneWidget);

    // There should be 9 grid cells (InkWell inside our custom cell)
    // We can look for 9 AnimatedContainer as a proxy (each cell uses one)
    expect(find.byType(AnimatedContainer), findsNWidgets(9));
  });

  testWidgets('Tapping a cell places X then O alternately', (WidgetTester tester) async {
    await tester.pumpWidget(const TicTacToeApp());

    // Tap first cell -> X
    await tester.tap(find.byType(AnimatedContainer).first);
    await tester.pumpAndSettle();
    expect(find.text('X'), findsOneWidget);

    // Tap second cell -> O
    final allCells = find.byType(AnimatedContainer);
    await tester.tap(allCells.at(1));
    await tester.pumpAndSettle();
    expect(find.text('O'), findsOneWidget);
  });
}
