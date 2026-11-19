import 'dart:async';
import 'dart:ui' as ui;

import 'package:floomer/src/features/color_picker/color_picker_controller.dart';
import 'package:flutter/widgets.dart';

class const ColorPickerScope({
  super.key,
  required final ui.Image image,
  required final double scale,
  required final Widget child,
}) extends StatefulWidget {
  static ColorPickerController? maybeOf(
    BuildContext context, {
    bool listen = true,
  }) {
    final inherited = listen
        ? context.dependOnInheritedWidgetOfExactType<_ColorPickerInherited>()
        : context.getInheritedWidgetOfExactType<_ColorPickerInherited>();

    return inherited?.notifier;
  }

  static ColorPickerController of(
    BuildContext context, {
    bool listen = true,
  }) {
    final result = maybeOf(context, listen: listen);
    assert(result != null, "ColorPickerController is not registered");
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
    _controller = ColorPickerController(
      image: widget.image,
      scale: widget.scale,
    );
    unawaited(_controller.load());
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
