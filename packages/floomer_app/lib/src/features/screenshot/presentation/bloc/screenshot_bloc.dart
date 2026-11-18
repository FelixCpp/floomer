import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:floomer/src/features/screenshot/domain/entities/screen_capture.dart';
import 'package:floomer/src/features/screenshot/domain/failures/screenshot_failure.dart';
import 'package:floomer/src/features/screenshot/domain/repositories/screenshot_repository.dart';
import 'package:floomer/src/features/screenshot/domain/usecases/capture_screenshot.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:use_in_case/use_in_case.dart';

part 'screenshot_bloc.freezed.dart';
part 'screenshot_event.dart';
part 'screenshot_state.dart';

class ScreenshotBloc({
  required ScreenshotRepository repository,
}) extends Bloc<ScreenshotEvent, ScreenshotState> {
  final _captureScreenshot = CaptureScreenshot(repository);

  this : super(const .initial()) {
    on<_Requested>(_onRequested, transformer: droppable());
  }

  Future<void> _onRequested(
    _Requested event,
    Emitter<ScreenshotState> emit,
  ) async {
    return _captureScreenshot
        .before((_) => emit(const .inProgress()))
        .after((result) => emit(.ready(result)))
        .typedIntercept<ScreenshotFailure>((failure) => emit(.failed(failure)))
        .run();
  }
}
