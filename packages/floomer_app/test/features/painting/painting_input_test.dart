import 'package:floomer/src/features/painting/painting_controller.dart';
import 'package:floomer/src/features/painting/painting_input.dart';
import 'package:floomer/src/features/painting/painting_scope.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

/// The surface drawn on, told apart from the ones MaterialApp brings along.
const Key _canvas = Key('canvas');

void main() {
  testWidgets('a painting drag does not move the surrounding viewer', (
    tester,
  ) async {
    final transformationController = TransformationController();
    addTearDown(transformationController.dispose);

    late PaintingController painting;

    await tester.pumpWidget(
      MaterialApp(
        home: PaintingScope(
          child: Builder(
            builder: (context) {
              painting = PaintingScope.of(context, listen: false);

              return InteractiveViewer(
                transformationController: transformationController,
                boundaryMargin: const EdgeInsets.all(double.infinity),
                child: const PaintingPointerInput(
                  child: ColoredBox(key: _canvas, color: Color(0xFF000000)),
                ),
              );
            },
          ),
        ),
      ),
    );

    final center = tester.getCenter(find.byKey(_canvas));
    final gesture = await tester.startGesture(
      center,
      kind: .mouse,
      buttons: kSecondaryMouseButton,
    );

    for (var step = 0; step < 4; ++step) {
      await gesture.moveBy(const Offset(25, 10));
      await tester.pump();
    }

    await gesture.up();
    await tester.pump();

    // The stroke has to arrive ...
    expect(painting.strokes, hasLength(1));
    expect(painting.strokes.single.length, greaterThan(1));

    // ... without the viewer panning along with it.
    expect(transformationController.value, Matrix4.identity());
  });

  testWidgets('a left drag still pans the viewer', (tester) async {
    final transformationController = TransformationController();
    addTearDown(transformationController.dispose);

    await tester.pumpWidget(
      MaterialApp(
        home: PaintingScope(
          child: InteractiveViewer(
            transformationController: transformationController,
            boundaryMargin: const EdgeInsets.all(double.infinity),
            child: const PaintingPointerInput(
              child: ColoredBox(key: _canvas, color: Color(0xFF000000)),
            ),
          ),
        ),
      ),
    );

    final center = tester.getCenter(find.byKey(_canvas));
    final gesture = await tester.startGesture(center, kind: .mouse);

    for (var step = 0; step < 4; ++step) {
      await gesture.moveBy(const Offset(25, 10));
      await tester.pump();
    }

    await gesture.up();
    await tester.pump();

    expect(transformationController.value, isNot(Matrix4.identity()));
  });
}
