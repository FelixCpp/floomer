part of 'screenshot_bloc.dart';

/// The variants stay private: callers construct events through the factory
/// constructors and only the bloc matches on the concrete types.
@freezed
sealed class ScreenshotEvent with _$ScreenshotEvent {
  /// Requests a capture of the display the cursor is currently on.
  const factory ScreenshotEvent.requested() = _Requested;
}
