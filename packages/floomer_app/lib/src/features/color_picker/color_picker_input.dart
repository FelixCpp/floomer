import 'package:floomer/src/features/color_picker/color_picker_scope.dart';
import 'package:flutter/widgets.dart';

/// Tracks the hovered pixel. Must be placed directly around the image, inside
/// any zoom or mirroring transforms, so that positions are in image space.
class const ColorPickerInput({
  super.key,
  required final Widget child,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = ColorPickerScope.of(context, listen: false);

    return MouseRegion(
      onExit: (_) => controller.clearHoveredColor(),
      child: Listener(
        onPointerHover: (event) =>
            controller.setImagePosition(event.localPosition),
        onPointerMove: (event) =>
            controller.setImagePosition(event.localPosition),
        child: child,
      ),
    );
  }
}
