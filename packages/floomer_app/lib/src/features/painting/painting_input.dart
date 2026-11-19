import 'package:floomer/src/features/painting/painting_scope.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';

class const PaintingKeyboardInput({
  super.key,
  required final Widget child,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = PaintingScope.of(context, listen: false);

    return CallbackShortcuts(
      bindings: {
        const SingleActivator(.keyZ, meta: true): () => controller.undo(),
        const SingleActivator(.keyC): () => controller.clear(),
      },
      child: child,
    );
  }
}

class const PaintingPointerInput({
  super.key,
  required final Widget child,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = PaintingScope.of(context, listen: false);

    return RawGestureDetector(
      gestures: {
        // Claims the gesture arena the moment the painting button goes down,
        // which rejects the surrounding InteractiveViewer's recognizer for
        // that pointer.
        //
        // Gesture recognizers accept every mouse button by default, so the
        // viewer would otherwise start panning on a right drag too. Switching
        // `panEnabled` off in reaction to a stroke cannot prevent that: the
        // rebuild lands a frame later, and by then the image has already
        // moved a few pixels.
        EagerGestureRecognizer:
            GestureRecognizerFactoryWithHandlers<EagerGestureRecognizer>(
              () => EagerGestureRecognizer(
                allowedButtonsFilter: _isPaintingButton,
              ),
              (_) {},
            ),
      },
      child: Listener(
        onPointerDown: (event) {
          if (_isPaintingButton(event.buttons)) {
            controller.startStroke(event.localPosition);
          }
        },
        onPointerMove: (event) {
          if (_isPaintingButton(event.buttons)) {
            controller.addPoint(event.localPosition);
          }
        },
        onPointerUp: (_) => controller.endStroke(),
        onPointerCancel: (_) => controller.endStroke(),
        child: child,
      ),
    );
  }
}

bool _isPaintingButton(int buttons) => (buttons & kSecondaryMouseButton) != 0;
