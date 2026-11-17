part of 'app_window_bloc.dart';

/// Nothing outside this library matches on the window state yet, so the
/// variants stay private. Make one public once a view needs to switch on it.
@freezed
sealed class AppWindowState with _$AppWindowState {
  /// The window exists but is fully transparent, which is the launch state.
  const factory AppWindowState.hidden() = _Hidden;

  const factory AppWindowState.visible() = _Visible;

  const factory AppWindowState.failed(AppWindowFailure failure) = _Failed;
}
