part of 'background_color_bloc.dart';

@freezed
abstract class BackgroundColorState with _$BackgroundColorState {
  /// Starts out black and changes once the latest screenshot is analyzed.
  const factory BackgroundColorState({
    @Default(ui.Color(0xFF000000)) ui.Color color,
  }) = _BackgroundColorState;
}
