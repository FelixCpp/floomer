import 'package:floomer/src/core/platform/floomer_method_channel.dart';
import 'package:floomer/src/features/screenshot/data/datasources/screenshot_datasource.dart';
import 'package:floomer/src/features/screenshot/domain/entities/screenshot.dart';
import 'package:floomer/src/features/screenshot/domain/failures/screenshot_failure.dart';
import 'package:floomer/src/features/screenshot/domain/repositories/screenshot_repository.dart';
import 'package:flutter/services.dart';

class ScreenshotRepositoryImpl({
  required final ScreenshotDataSource _dataSource,
}) implements ScreenshotRepository {
  Screenshot? _current;

  @override
  Screenshot? get current => _current;

  @override
  Future<Screenshot> capture() async {
    try {
      final screenshot = await (await _dataSource.captureDisplayUnderCursor())
          .toEntity();

      _current?.image.dispose();
      _current = screenshot;
      return screenshot;
    } on PlatformException catch (exception) {
      throw _failureFor(exception);
    }
  }

  @override
  void dispose() {
    _current?.image.dispose();
    _current = null;
  }

  ScreenshotFailure _failureFor(PlatformException exception) {
    return switch (exception.code) {
      FloomerMethodChannel.permissionDeniedCode => const .permissionDenied(),
      FloomerMethodChannel.noDisplayCode => const .noDisplay(),
      FloomerMethodChannel.conversionFailedCode => const .conversionFailed(),
      _ => .unexpected(exception.message ?? exception.code),
    };
  }
}
