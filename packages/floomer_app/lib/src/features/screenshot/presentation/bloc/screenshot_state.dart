part of 'screenshot_bloc.dart';

@freezed
sealed class ScreenshotState with _$ScreenshotState {
  const factory ScreenshotState.initial() = _Initial;
  const factory ScreenshotState.inProgress() = _InProgress;
  const factory ScreenshotState.ready(ScreenCapture screenshot) = _Ready;
  const factory ScreenshotState.failed(ScreenshotFailure failure) = _Failed;

  const ScreenshotState._();

  bool get isResolved => map(
    initial: (_) => false,
    inProgress: (_) => false,
    ready: (_) => true,
    failed: (_) => true,
  );
}
