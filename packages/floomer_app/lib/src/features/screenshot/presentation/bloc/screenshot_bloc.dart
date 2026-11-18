import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:floomer/src/features/screenshot/domain/entities/screenshot.dart';
import 'package:floomer/src/features/screenshot/domain/failures/screenshot_failure.dart';
import 'package:floomer/src/features/screenshot/domain/repositories/screenshot_repository.dart';
import 'package:floomer/src/features/screenshot/domain/usecases/capture_screenshot.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'screenshot_bloc.freezed.dart';
part 'screenshot_event.dart';
part 'screenshot_state.dart';

class ScreenshotBloc({
  required ScreenshotRepository repository,
}) extends Bloc<ScreenshotEvent, ScreenshotState> {
  final _captureScreenshot = CaptureScreenshot(repository);

  this : super(const ScreenshotState.initial()) {
    on<_Requested>(_onRequested, transformer: droppable());
  }

  Future<void> _onRequested(
    _Requested event,
    Emitter<ScreenshotState> emit,
  ) async {
    emit(const ScreenshotState.inProgress());

    try {
      emit(ScreenshotState.ready(await _captureScreenshot()));
    } on ScreenshotFailure catch (failure) {
      emit(ScreenshotState.failed(failure));
    }
  }
}
