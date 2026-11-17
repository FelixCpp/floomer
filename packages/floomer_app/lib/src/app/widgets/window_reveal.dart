import 'package:floomer/src/features/app_window/presentation/bloc/app_window_bloc.dart';
import 'package:floomer/src/features/screenshot/presentation/bloc/screenshot_bloc.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

/// Reveals the native window once the capture has run to a conclusion.
///
/// The window starts out fully transparent (see `MainFlutterWindow.swift`),
/// which is what keeps floomer out of its own screenshot. Tying the reveal to a
/// resolved [ScreenshotState] rather than to `main()` means a failed capture
/// still produces a visible window instead of an app that silently never
/// appears.
///
/// Lives in the app layer because it is the one place that coordinates two
/// features; neither feature should have to know about the other.
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
    // Covers the case where the bloc already resolved before this widget was
    // mounted; `BlocListener` only reacts to changes.
    _revealIfResolved(BlocProvider.of<ScreenshotBloc>(context).state);
  }

  void _revealIfResolved(ScreenshotState state) {
    if (_revealed || !state.isResolved) return;
    _revealed = true;

    final bloc = BlocProvider.of<AppWindowBloc>(context);
    // Wait for the frame that renders this state before showing the window,
    // otherwise the user sees an empty window first.
    SchedulerBinding.instance.addPostFrameCallback((_) {
      bloc.add(const AppWindowEvent.showRequested());
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
