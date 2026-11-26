import 'dart:async';

import 'package:floomer/src/features/color_picker/color_picker_scope.dart';
import 'package:flutter/widgets.dart';

class const ColorPickerInput({
  super.key,
  required final Widget child,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _MousePositionProvider(
      child: _KeyProvider(child: child),
    );
  }
}

class const ColorPickerPointerInput({
  super.key,
  required final Widget child,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = ColorPickerScope.of(context);

    void update(Offset position) {
      if (context.size case final size?) {
        controller.setImagePosition(position, size);
      }
    }

    return MouseRegion(
      onExit: (_) => controller.clearImagePosition(),
      child: Listener(
        onPointerHover: (event) => update(event.localPosition),
        onPointerMove: (event) => update(event.localPosition),
        child: child,
      ),
    );
  }
}

class const _MousePositionProvider({
  required final Widget child,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = ColorPickerScope.of(context);

    return Listener(
      onPointerHover: (event) =>
          controller.setMousePosition(event.localPosition),
      onPointerMove: (event) =>
          controller.setMousePosition(event.localPosition),
      child: child,
    );
  }
}

class const _KeyProvider({
  required final Widget child,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = ColorPickerScope.of(context);

    return CallbackShortcuts(
      bindings: {
        const SingleActivator(.keyP): controller.toggle,
        const SingleActivator(.keyC, meta: true): () =>
            unawaited(controller.copy(.hex)),
        const SingleActivator(.keyC, meta: true, shift: true): () =>
            unawaited(controller.copy(.rgb)),
      },
      child: FocusScope(
        child: Focus(
          autofocus: true,
          child: child,
        ),
      ),
    );
  }
}
