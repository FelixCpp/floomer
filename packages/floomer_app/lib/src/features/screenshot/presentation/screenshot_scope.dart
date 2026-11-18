import 'package:floomer/src/core/platform/floomer_method_channel.dart';
import 'package:floomer/src/features/screenshot/data/datasources/screenshot_datasource.dart';
import 'package:floomer/src/features/screenshot/data/repositories/screenshot_repository_impl.dart';
import 'package:floomer/src/features/screenshot/domain/repositories/screenshot_repository.dart';
import 'package:floomer/src/features/screenshot/presentation/bloc/screenshot_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

class const ScreenshotScope({
  required final Widget child,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<ScreenshotRepository>(
      create: (context) => ScreenshotRepositoryImpl(
        dataSource: MethodChannelScreenshotDataSource(
          channel: RepositoryProvider.of<FloomerMethodChannel>(context),
        ),
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
    );
  }
}
