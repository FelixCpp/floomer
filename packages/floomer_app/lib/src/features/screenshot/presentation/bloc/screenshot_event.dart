part of 'screenshot_bloc.dart';

@freezed
sealed class ScreenshotEvent with _$ScreenshotEvent {
  const factory ScreenshotEvent.requested() = _Requested;
}
