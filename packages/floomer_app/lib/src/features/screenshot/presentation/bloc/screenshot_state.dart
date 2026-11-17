part of 'screenshot_bloc.dart';

/// Unlike the events, the state variants are public: `ScreenshotPage` lives in
/// another library and pattern matches on them, which needs the type names.
@freezed
sealed class ScreenshotState with _$ScreenshotState {
  const factory ScreenshotState.initial() = ScreenshotInitial;

  const factory ScreenshotState.inProgress() = ScreenshotInProgress;

  const factory ScreenshotState.ready(Screenshot screenshot) = ScreenshotReady;

  const factory ScreenshotState.failed(ScreenshotFailure failure) =
      ScreenshotFailed;

  const ScreenshotState._();

  /// Whether the capture has run to a conclusion, successful or not.
  ///
  /// Decides when the native window may be revealed: anything else means there
  /// is nothing worth showing yet.
  bool get isResolved => switch (this) {
    ScreenshotInitial() || ScreenshotInProgress() => false,
    ScreenshotReady() || ScreenshotFailed() => true,
  };
}
