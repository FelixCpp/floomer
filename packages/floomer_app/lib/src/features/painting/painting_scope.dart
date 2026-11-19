import 'package:floomer/src/features/painting/painting_controller.dart';
import 'package:flutter/widgets.dart';

class const PaintingScope({
  super.key,
  required final Widget child,
}) extends StatefulWidget {
  static PaintingController? maybeOf(
    BuildContext context, {
    bool listen = true,
  }) {
    if (listen) {
      return context
          .dependOnInheritedWidgetOfExactType<_PaintingInherited>()
          ?.notifier;
    }

    return context
        .getInheritedWidgetOfExactType<_PaintingInherited>()
        ?.notifier;
  }

  static PaintingController of(BuildContext context, {bool listen = true}) {
    final result = maybeOf(context, listen: listen);
    assert(result != null, "PaintingController not registered.");
    return result!;
  }

  @override
  State<PaintingScope> createState() => _PaintingScopeState();
}

class _PaintingScopeState extends State<PaintingScope> {
  late final PaintingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PaintingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _PaintingInherited(
      notifier: _controller,
      child: widget.child,
    );
  }
}

class _PaintingInherited({
  required super.notifier,
  required super.child,
}) extends InheritedNotifier<PaintingController>;
