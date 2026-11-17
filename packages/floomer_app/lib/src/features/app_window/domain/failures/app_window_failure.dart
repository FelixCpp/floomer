import 'package:floomer/src/core/error/failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_window_failure.freezed.dart';

@freezed
sealed class AppWindowFailure with _$AppWindowFailure implements Failure {
  const factory AppWindowFailure.settingsUnavailable() =
      SettingsUnavailableFailure;

  const factory AppWindowFailure.unexpected(String message) =
      UnexpectedAppWindowFailure;
}
