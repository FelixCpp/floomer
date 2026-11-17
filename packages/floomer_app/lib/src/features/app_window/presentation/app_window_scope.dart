import 'package:floomer/src/core/platform/floomer_method_channel.dart';
import 'package:floomer/src/features/app_window/data/datasources/app_window_datasource.dart';
import 'package:floomer/src/features/app_window/data/repositories/app_window_repository_impl.dart';
import 'package:floomer/src/features/app_window/domain/repositories/app_window_repository.dart';
import 'package:floomer/src/features/app_window/presentation/bloc/app_window_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

class const AppWindowScope({
  required final Widget child,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<AppWindowRepository>(
      create: (context) => AppWindowRepositoryImpl(
        dataSource: MethodChannelAppWindowDataSource(
          channel: RepositoryProvider.of<FloomerMethodChannel>(context),
        ),
      ),
      child: BlocProvider(
        create: (context) => AppWindowBloc(
          repository: RepositoryProvider.of<AppWindowRepository>(context),
        ),
        child: child,
      ),
    );
  }
}
