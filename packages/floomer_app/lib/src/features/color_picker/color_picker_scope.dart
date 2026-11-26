import 'package:floomer/src/features/color_picker/color_picker_controller.dart';
import 'package:floomer/src/features/screenshot/domain/entities/screen_capture.dart';
import 'package:flutter/widgets.dart';

class const ColorPickerScope({
  super.key,
  required final ScreenCapture capture,
  required final Widget child,
}) extends StatefulWidget {
  static ColorPickerController? maybeOf(
    BuildContext context, {
    bool listen = false,
  }) {
    if (listen) {
      return context
          .dependOnInheritedWidgetOfExactType<_ColorPickerInherited>()
          ?.notifier;
    }

    return context
        .getInheritedWidgetOfExactType<_ColorPickerInherited>()
        ?.notifier;
  }

  static ColorPickerController of(
    BuildContext context, {
    bool listen = false,
  }) {
    final result = maybeOf(context, listen: listen);
    assert(result != null, 'ColorPickerController is not registered.');

    return result!;
  }

  @override
  State<ColorPickerScope> createState() => _ColorPickerScopeState();
}

class _ColorPickerScopeState extends State<ColorPickerScope> {
  late final ColorPickerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ColorPickerController(pixels: widget.capture.pixels);
  }

  @override
  void didUpdateWidget(ColorPickerScope oldWidget) {
    super.didUpdateWidget(oldWidget);
    _controller.pixels = widget.capture.pixels;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _ColorPickerInherited(
      notifier: _controller,
      child: widget.child,
    );
  }
}

class const _ColorPickerInherited({
  required super.notifier,
  required super.child,
}) extends InheritedNotifier<ColorPickerController>;
