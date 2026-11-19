part of 'app_window_bloc.dart';

@freezed
sealed class AppWindowEvent with _$AppWindowEvent {
  const factory AppWindowEvent.showRequested() = _ShowRequested;
  const factory AppWindowEvent.screenRecordingSettingsRequested() =
      _ScreenRecordingSettingsRequested;
  const factory AppWindowEvent.closeRequested() = _CloseRequested;
}
