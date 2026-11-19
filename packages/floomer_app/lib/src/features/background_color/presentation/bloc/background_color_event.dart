part of 'background_color_bloc.dart';

@freezed
sealed class BackgroundColorEvent with _$BackgroundColorEvent {
  const factory BackgroundColorEvent.started() = _Started;
}
