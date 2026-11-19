import 'package:floomer/src/features/background_color/data/repositories/background_color_repository_impl.dart';
import 'package:floomer/src/features/background_color/domain/repositories/background_color_repository.dart';
import 'package:floomer/src/features/background_color/presentation/bloc/background_color_bloc.dart';
import 'package:floomer/src/features/screenshot/domain/repositories/screenshot_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

class const BackgroundColorScope({
  required final Widget child,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<BackgroundColorRepository>(
      create: (context) => BackgroundColorRepositoryImpl(
        screenshots: RepositoryProvider.of<ScreenshotRepository>(context),
      ),
      dispose: (repository) => repository.dispose(),
      child: BlocProvider(
        create: (context) => BackgroundColorBloc(
          repository: RepositoryProvider.of<BackgroundColorRepository>(
            context,
          ),
        )..add(const .started()),
        child: child,
      ),
    );
  }
}
