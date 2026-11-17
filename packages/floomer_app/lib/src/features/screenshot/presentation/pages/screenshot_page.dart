import 'package:floomer/src/features/screenshot/domain/failures/screenshot_failure.dart';
import 'package:floomer/src/features/screenshot/presentation/bloc/screenshot_bloc.dart';
import 'package:floomer/src/features/screenshot/presentation/widgets/capture_failure_view.dart';
import 'package:floomer/src/features/screenshot/presentation/widgets/capture_view.dart';
import 'package:floomer/src/features/screenshot/presentation/widgets/permission_denied_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

class const ScreenshotPage({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScreenshotBloc, ScreenshotState>(
      builder: (context, state) => switch (state) {
        // Nothing to render while capturing: the window is still invisible, so
        // a spinner would never be seen anyway.
        ScreenshotInitial() ||
        ScreenshotInProgress() => const SizedBox.shrink(),
        ScreenshotReady(:final screenshot) => CaptureView(
          screenshot: screenshot,
        ),
        ScreenshotFailed(failure: PermissionDeniedFailure()) =>
          const PermissionDeniedView(),
        ScreenshotFailed(:final failure) => CaptureFailureView(
          failure: failure,
        ),
      },
    );
  }
}
