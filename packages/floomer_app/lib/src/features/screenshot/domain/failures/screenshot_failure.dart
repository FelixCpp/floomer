import 'package:floomer/src/core/error/failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'screenshot_failure.freezed.dart';

@freezed
sealed class ScreenshotFailure with _$ScreenshotFailure implements Failure {
  /// Screen recording has not been granted. macOS only applies the permission
  /// after a relaunch, so the user has to start floomer again.
  const factory ScreenshotFailure.permissionDenied() = PermissionDeniedFailure;

  /// No capturable display was found.
  const factory ScreenshotFailure.noDisplay() = NoDisplayFailure;

  /// The capture could not be turned into pixels floomer can render.
  const factory ScreenshotFailure.conversionFailed() = ConversionFailedFailure;

  /// Anything the native side reported that does not map to a known case.
  const factory ScreenshotFailure.unexpected(String message) =
      UnexpectedScreenshotFailure;
}
