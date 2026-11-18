import 'package:floomer/src/features/flashlight/flashlight_controller.dart';
import 'package:flutter/widgets.dart';

class const FlashlightScope({
  super.key,
  required final Widget child,
}) extends StatefulWidget {
  static FlashlightController? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_FlashlightInherited>()
        ?.notifier;
  }

  static FlashlightController of(BuildContext context) {
    final result = maybeOf(context);
    assert(result != null, "FlashlightController is not registered.");
    return result!;
  }

  @override
  State<FlashlightScope> createState() => _FlashlightScopeState();
}

class _FlashlightScopeState extends State<FlashlightScope> {
  late final FlashlightController _controller;

  @override
  void initState() {
    super.initState();
    _controller = FlashlightController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _FlashlightInherited(
      notifier: _controller,
      child: widget.child,
    );
  }
}

class const _FlashlightInherited({
  required super.notifier,
  required super.child,
}) extends InheritedNotifier<FlashlightController>;
