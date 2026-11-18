import 'package:floomer/src/core/error/failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'screenshot_failure.freezed.dart';

@freezed
sealed class ScreenshotFailure with _$ScreenshotFailure implements Failure {
  const factory ScreenshotFailure.permissionDenied() = _PermissionDenied;
  const factory ScreenshotFailure.noDisplay() = _NoDisplay;
  const factory ScreenshotFailure.conversionFailed() = _ConversionFailed;
  const factory ScreenshotFailure.unexpected(String message) = _Unexpected;
}
