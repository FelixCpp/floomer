import 'package:floomer/src/app/widgets/shortcut_overlay.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  /// The overlay only reacts to keys while something below it has focus, which
  /// is what the capture view's own focus nodes do in the real app.
  Future<void> pumpOverlay(WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ShortcutOverlay(
          child: Focus(autofocus: true, child: SizedBox.expand()),
        ),
      ),
    );
    await tester.pump();
  }

  double opacityOf(WidgetTester tester) {
    return tester.widget<AnimatedOpacity>(find.byType(AnimatedOpacity)).opacity;
  }

  testWidgets('lists every shortcut and lays out without an overflow', (
    tester,
  ) async {
    await pumpOverlay(tester);

    expect(find.text('Shortcuts'), findsOneWidget);
    expect(find.text('Reset zoom, pan and mirroring'), findsOneWidget);
    expect(find.text('Undo the last stroke'), findsOneWidget);
    expect(tester.takeException(), isNull);

    await tester.pump(const Duration(seconds: 6));
  });

  testWidgets('shows itself on startup and fades out on its own', (
    tester,
  ) async {
    await pumpOverlay(tester);
    expect(opacityOf(tester), 1.0);

    await tester.pump(const Duration(seconds: 6));
    expect(opacityOf(tester), 0.0);
  });

  testWidgets('H hides and shows the list again', (tester) async {
    await pumpOverlay(tester);

    await tester.sendKeyEvent(LogicalKeyboardKey.keyH);
    await tester.pump();
    expect(opacityOf(tester), 0.0);

    await tester.sendKeyEvent(LogicalKeyboardKey.keyH);
    await tester.pump();
    expect(opacityOf(tester), 1.0);

    // The startup timer must not pull the list away after it was opened.
    await tester.pump(const Duration(seconds: 6));
    expect(opacityOf(tester), 1.0);
  });
}
