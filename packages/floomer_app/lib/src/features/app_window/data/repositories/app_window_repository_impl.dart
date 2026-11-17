import 'package:floomer/src/features/app_window/data/datasources/app_window_datasource.dart';
import 'package:floomer/src/features/app_window/domain/failures/app_window_failure.dart';
import 'package:floomer/src/features/app_window/domain/repositories/app_window_repository.dart';
import 'package:flutter/services.dart';

class const AppWindowRepositoryImpl({
  required final AppWindowDataSource _dataSource,
}) implements AppWindowRepository {
  static const String _openSettingsFailedCode = 'open_settings_failed';

  @override
  Future<void> show() {
    return _guard(_dataSource.showWindow);
  }

  @override
  Future<void> openScreenRecordingSettings() {
    return _guard(_dataSource.openScreenRecordingSettings);
  }

  @override
  Future<void> close() {
    return _guard(_dataSource.closeApp);
  }

  Future<void> _guard(Future<void> Function() action) async {
    try {
      await action();
    } on PlatformException catch (exception) {
      throw switch (exception.code) {
        _openSettingsFailedCode => const AppWindowFailure.settingsUnavailable(),
        _ => AppWindowFailure.unexpected(exception.message ?? exception.code),
      };
    }
  }
}
