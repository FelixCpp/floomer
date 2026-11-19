import 'package:floomer/src/features/mirroring/mirroring_controller.dart';
import 'package:flutter/widgets.dart';

class const MirroringScope({
  required final Widget child,
}) extends StatefulWidget {
  static MirroringController? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_MirroringInherited>()
        ?.notifier;
  }

  static MirroringController of(BuildContext context) {
    final result = maybeOf(context);
    assert(result != null, "MirroringController is not registered.");
    return result!;
  }

  @override
  State<MirroringScope> createState() => _MirroringScopeState();
}

class _MirroringScopeState extends State<MirroringScope> {
  late final MirroringController _controller;

  @override
  void initState() {
    super.initState();
    _controller = MirroringController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _MirroringInherited(
      notifier: _controller,
      child: widget.child,
    );
  }
}

class const _MirroringInherited({
  required super.notifier,
  required super.child,
}) extends InheritedNotifier<MirroringController>;
