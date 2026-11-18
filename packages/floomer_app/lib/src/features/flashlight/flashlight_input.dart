import 'package:floomer/src/features/flashlight/flashlight_scope.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class const FlashlightInput({
  super.key,
  required final Widget child,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = FlashlightScope.of(context);

    return CallbackShortcuts(
      bindings: {
        const SingleActivator(.keyF): () => controller.toggle(),
      },
      child: Listener(
        onPointerMove: (event) => controller.setMousePosition(
          event.localPosition.dx,
          event.localPosition.dy,
        ),
        onPointerHover: (event) => controller.setMousePosition(
          event.localPosition.dx,
          event.localPosition.dy,
        ),
        onPointerSignal: (event) {
          if (event is PointerScrollEvent && controller.canResizeLight) {
            controller.scaleLightRadius(_resizeDelta(event.scrollDelta));
          }
        },
        onPointerPanZoomUpdate: (event) {
          if (controller.canResizeLight) {
            controller.scaleLightRadius(_resizeDelta(event.panDelta));
          }
        },
        child: FocusScope(
          child: Focus(
            onKeyEvent: (node, event) {
              controller.setLightRadiusChange(
                HardwareKeyboard.instance.isShiftPressed,
              );

              return .ignored;
            },
            autofocus: true,
            child: child,
          ),
        ),
      ),
    );
  }

  /// macOS turns Shift + vertical scrolling into horizontal scrolling, so
  /// fall back to the horizontal delta when there is no vertical one.
  double _resizeDelta(Offset delta) => delta.dy != 0 ? delta.dy : delta.dx;
}
