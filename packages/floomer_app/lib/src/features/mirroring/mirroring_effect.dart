import 'package:floomer/src/features/mirroring/mirroring_input.dart';
import 'package:floomer/src/features/mirroring/mirroring_scope.dart';
import 'package:flutter/widgets.dart';

class const MirroringEffect({
  super.key,
  required final Widget child,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MirroringScope(
      child: MirroringInput(
        child: _MousePositionProvider(
          child: Builder(
            builder: (context) {
              final controller = MirroringScope.of(context);

              return Transform(
                transform: controller.matrix,
                child: child,
              );
            },
          ),
        ),
      ),
    );
  }
}

class const _MousePositionProvider({
  required final Widget child,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerHover: (event) => MirroringScope.of(context).setMousePosition(
        event.localPosition.dx,
        event.localPosition.dy,
      ),
      onPointerMove: (event) => MirroringScope.of(context).setMousePosition(
        event.localPosition.dx,
        event.localPosition.dy,
      ),
      child: child,
    );
  }
}
