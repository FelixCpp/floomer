import 'package:floomer/src/features/app_window/presentation/bloc/app_window_bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

class const CloseOnEscape({
  required final Widget child,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CallbackShortcuts(
      bindings: {
        const SingleActivator(LogicalKeyboardKey.escape): () {
          BlocProvider.of<AppWindowBloc>(context).add(
            const AppWindowEvent.closeRequested(),
          );
        },
      },
      child: Focus(
        autofocus: true,
        child: child,
      ),
    );
  }
}
