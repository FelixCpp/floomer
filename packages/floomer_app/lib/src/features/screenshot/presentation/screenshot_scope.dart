import 'package:floomer/src/core/platform/floomer_method_channel.dart';
import 'package:floomer/src/features/screenshot/data/datasources/screenshot_datasource.dart';
import 'package:floomer/src/features/screenshot/data/repositories/screenshot_repository_impl.dart';
import 'package:floomer/src/features/screenshot/domain/repositories/screenshot_repository.dart';
import 'package:floomer/src/features/screenshot/presentation/bloc/screenshot_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

/// Provides the screenshot feature's dependencies.
///
/// Scoped to this subtree rather than the whole app: nothing outside the
/// feature talks to the capture, and the repository's `dispose` — which frees
/// roughly 30 MB of GPU memory — then runs when the feature is torn down
/// instead of only at app exit.
class const ScreenshotScope({
  required final Widget child,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<ScreenshotDataSource>(
      create: (context) => MethodChannelScreenshotDataSource(
        channel: RepositoryProvider.of<FloomerMethodChannel>(context),
      ),
      child: RepositoryProvider<ScreenshotRepository>(
        create: (context) => ScreenshotRepositoryImpl(
          dataSource: RepositoryProvider.of<ScreenshotDataSource>(context),
        ),
        dispose: (repository) => repository.dispose(),
        child: BlocProvider(
          create: (context) => ScreenshotBloc(
            repository: RepositoryProvider.of<ScreenshotRepository>(
              context,
            ),
          )..add(const ScreenshotEvent.requested()),
          child: child,
        ),
      ),
    );
  }
}
