import 'dart:async';
import 'dart:ui';

import 'package:floomer/src/core/platform/floomer_method_channel.dart';
import 'package:floomer/src/features/screenshot/data/datasources/screenshot_datasource.dart';
import 'package:floomer/src/features/screenshot/data/models/screen_capture_dto.dart';
import 'package:floomer/src/features/screenshot/domain/entities/screen_capture.dart';
import 'package:floomer/src/features/screenshot/domain/failures/screenshot_failure.dart';
import 'package:floomer/src/features/screenshot/domain/repositories/screenshot_repository.dart';
import 'package:flutter/services.dart';

class ScreenshotRepositoryImpl({
  required final ScreenshotDataSource _dataSource,
}) implements ScreenshotRepository {
  ScreenCapture? _current;

  @override
  ScreenCapture? get current => _current;

  @override
  Future<ScreenCapture> capture() async {
    try {
      final capture = await _dataSource.captureScreenshot();
      final screenshot = await capture.toEntity();

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

extension on ScreenCaptureDto {
  Future<ScreenCapture> toEntity() {
    final capture = Completer<ScreenCapture>();

    decodeImageFromPixels(
      pixels,
      width,
      height,
      .bgra8888,
      rowBytes: bytesPerRow,
      (image) {
        capture.complete(
          .new(
            image: image,
            scale: scale,
          ),
        );
      },
    );

    return capture.future;
  }
}
