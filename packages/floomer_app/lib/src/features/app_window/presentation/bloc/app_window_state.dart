part of 'app_window_bloc.dart';

@freezed
sealed class AppWindowState with _$AppWindowState {
  const factory AppWindowState.hidden() = _Hidden;
  const factory AppWindowState.visible() = _Visible;
  const factory AppWindowState.failed(AppWindowFailure failure) = _Failed;
}
