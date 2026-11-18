import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:floomer/src/features/app_window/domain/failures/app_window_failure.dart';
import 'package:floomer/src/features/app_window/domain/repositories/app_window_repository.dart';
import 'package:floomer/src/features/app_window/domain/usecases/close_app.dart';
import 'package:floomer/src/features/app_window/domain/usecases/open_screen_recording_settings.dart';
import 'package:floomer/src/features/app_window/domain/usecases/show_window.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_window_bloc.freezed.dart';
part 'app_window_event.dart';
part 'app_window_state.dart';

class AppWindowBloc({
  required AppWindowRepository repository,
}) extends Bloc<AppWindowEvent, AppWindowState> {
  final _showWindow = ShowWindow(repository);
  final _openScreenRecordingSettings = OpenScreenRecordingSettings(repository);
  final _closeApp = CloseApp(repository);

  this : super(const AppWindowState.hidden()) {
    on<_ShowRequested>(_onShowRequested, transformer: droppable());
    on<_ScreenRecordingSettingsRequested>(
      _onSettingsRequested,
      transformer: droppable(),
    );
    on<_CloseRequested>(_onCloseRequested, transformer: droppable());
  }

  Future<void> _onShowRequested(
    _ShowRequested event,
    Emitter<AppWindowState> emit,
  ) async {
    try {
      await _showWindow();
      emit(const AppWindowState.visible());
    } on AppWindowFailure catch (failure) {
      emit(AppWindowState.failed(failure));
    }
  }

  Future<void> _onSettingsRequested(
    _ScreenRecordingSettingsRequested event,
    Emitter<AppWindowState> emit,
  ) async {
    try {
      await _openScreenRecordingSettings();
    } on AppWindowFailure catch (failure) {
      emit(AppWindowState.failed(failure));
    }
  }

  Future<void> _onCloseRequested(
    _CloseRequested event,
    Emitter<AppWindowState> emit,
  ) async {
    try {
      await _closeApp();
    } on AppWindowFailure catch (failure) {
      emit(AppWindowState.failed(failure));
    }
  }
}
