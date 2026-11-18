import 'package:floomer/src/features/app_window/presentation/bloc/app_window_bloc.dart';
import 'package:floomer/src/features/screenshot/presentation/widgets/centered_message.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

class const PermissionDeniedView({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<AppWindowBloc>(context);

    return CenteredMessage(
      title: 'floomer needs screen recording access',
      body:
          'Enable floomer under Privacy & Security > Screen Recording, '
          'then start floomer again.',
      actions: [
        FilledButton(
          onPressed: () => bloc.add(
            const .screenRecordingSettingsRequested(),
          ),
          child: Text('Open System Settings'),
        ),
        TextButton(
          onPressed: () => bloc.add(const .closeRequested()),
          child: Text('Quit'),
        ),
      ],
    );
  }
}
