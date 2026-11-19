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

    return Listener(
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
    );
  }

  bool _isPaintingButton(int buttons) => (buttons & kSecondaryMouseButton) != 0;
}
