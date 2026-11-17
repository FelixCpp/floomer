import 'package:floomer/src/features/app_window/presentation/bloc/app_window_bloc.dart';
import 'package:floomer/src/features/screenshot/domain/failures/screenshot_failure.dart';
import 'package:floomer/src/features/screenshot/presentation/widgets/centered_message.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

/// Shown when the capture failed for a reason the user cannot act on.
class const CaptureFailureView({
  required final ScreenshotFailure failure,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CenteredMessage(
      title: 'The screenshot could not be taken',
      body: _body,
      actions: [
        TextButton(
          onPressed: () => BlocProvider.of<AppWindowBloc>(
            context,
          ).add(const AppWindowEvent.closeRequested()),
          child: Text('Quit'),
        ),
      ],
    );
  }

  /// Failures carry no text of their own, so the wording lives here.
  String get _body => switch (failure) {
    PermissionDeniedFailure() => 'floomer is not allowed to record the screen.',
    NoDisplayFailure() => 'No capturable display was found.',
    ConversionFailedFailure() =>
      'The capture could not be converted into an image.',
    UnexpectedScreenshotFailure(:final message) => message,
  };
}
