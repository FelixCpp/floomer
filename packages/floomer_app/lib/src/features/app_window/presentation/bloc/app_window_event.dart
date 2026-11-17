part of 'app_window_bloc.dart';

@freezed
sealed class AppWindowEvent with _$AppWindowEvent {
  /// Requests that the native window becomes visible.
  const factory AppWindowEvent.showRequested() = _ShowRequested;

  /// Requests the Screen Recording section of System Settings.
  const factory AppWindowEvent.screenRecordingSettingsRequested() =
      _ScreenRecordingSettingsRequested;

  /// Requests termination of the application.
  const factory AppWindowEvent.closeRequested() = _CloseRequested;
}
