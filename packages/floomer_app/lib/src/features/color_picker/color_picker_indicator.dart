import 'package:floomer/src/features/color_picker/color_picker_scope.dart';
import 'package:flutter/widgets.dart';

/// Draws the hovered color next to the cursor. Must be placed outside any zoom,
/// mirroring or shader effects, so that it is drawn in window space.
class const ColorPickerIndicator({
  super.key,
  required final Widget child,
}) extends StatelessWidget {
  static const _cursorOffset = 16.0;

  @override
  Widget build(BuildContext context) {
    final controller = ColorPickerScope.of(context);
    final color = controller.hoveredColor;

    return CallbackShortcuts(
      bindings: {
        const SingleActivator(.keyC): controller.toggle,
      },
      child: FocusScope(
        child: Focus(
          autofocus: true,
          child: MouseRegion(
            cursor: controller.isActive
                ? SystemMouseCursors.precise
                : MouseCursor.defer,
            onHover: (event) =>
                controller.setScreenPosition(event.localPosition),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Stack(
                  children: [
                    child,
                    if (controller.isActive && color != null)
                      _positioned(
                        position: controller.screenPosition,
                        bounds: constraints.biggest,
                        child: IgnorePointer(
                          child: _Swatch(color: color),
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  /// Places [child] at the bottom right of the cursor, and flips it to the
  /// other side when it would leave the window.
  Widget _positioned({
    required Offset position,
    required Size bounds,
    required Widget child,
  }) {
    final flipX =
        position.dx > bounds.width - _Swatch.size.width - 2 * _cursorOffset;
    final flipY =
        position.dy > bounds.height - _Swatch.size.height - 2 * _cursorOffset;

    return Positioned(
      left: flipX ? null : position.dx + _cursorOffset,
      right: flipX ? bounds.width - position.dx + _cursorOffset : null,
      top: flipY ? null : position.dy + _cursorOffset,
      bottom: flipY ? bounds.height - position.dy + _cursorOffset : null,
      child: child,
    );
  }
}

class const _Swatch({
  required final Color color,
}) extends StatelessWidget {
  static const size = Size(112.0, 32.0);

  @override
  Widget build(BuildContext context) {
    final hex = color
        .toARGB32()
        .toRadixString(16)
        .padLeft(8, '0')
        .substring(2)
        .toUpperCase();

    return Container(
      width: size.width,
      height: size.height,
      padding: const .all(4.0),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: .circular(6.0),
        border: .all(color: const Color(0x33FFFFFF)),
      ),
      child: Row(
        spacing: 8.0,
        children: [
          AspectRatio(
            aspectRatio: 1.0,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: color,
                borderRadius: .circular(3.0),
                border: .all(color: const Color(0x33FFFFFF)),
              ),
            ),
          ),
          Text(
            '#$hex',
            style: const TextStyle(
              color: Color(0xFFFFFFFF),
              fontSize: 13.0,
              fontFamily: 'Menlo',
            ),
          ),
        ],
      ),
    );
  }
}
