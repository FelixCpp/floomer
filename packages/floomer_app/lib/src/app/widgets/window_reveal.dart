import 'package:floomer/src/features/app_window/presentation/bloc/app_window_bloc.dart';
import 'package:floomer/src/features/screenshot/presentation/bloc/screenshot_bloc.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

class const WindowReveal({required final Widget child, super.key})
    extends StatefulWidget {
  @override
  State<WindowReveal> createState() => _WindowRevealState();
}

class _WindowRevealState extends State<WindowReveal> {
  bool _revealed = false;

  @override
  void initState() {
    super.initState();
    _revealIfResolved(BlocProvider.of<ScreenshotBloc>(context).state);
  }

  void _revealIfResolved(ScreenshotState state) {
    if (_revealed || !state.isResolved) return;
    _revealed = true;

    final bloc = BlocProvider.of<AppWindowBloc>(context);
    SchedulerBinding.instance.addPostFrameCallback((_) {
      bloc.add(const .showRequested());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ScreenshotBloc, ScreenshotState>(
      listener: (_, state) => _revealIfResolved(state),
      child: widget.child,
    );
  }
}
