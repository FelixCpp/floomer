import 'package:floomer/src/features/app_window/presentation/bloc/app_window_bloc.dart';
import 'package:floomer/src/features/screenshot/domain/failures/screenshot_failure.dart';
import 'package:floomer/src/features/screenshot/presentation/widgets/centered_message.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

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
          onPressed: () {
            BlocProvider.of<AppWindowBloc>(context).add(
              const .closeRequested(),
            );
          },
          child: Text('Quit'),
        ),
      ],
    );
  }

  String get _body => failure.when(
    permissionDenied: () => 'floomer is not allowed to record the screen.',
    noDisplay: () => 'No capturable display was found.',
    conversionFailed: () => 'The capture could not be converted into an image.',
    unexpected: (message) => message,
  );
}
