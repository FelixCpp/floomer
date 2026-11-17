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

/// Drives the capture that happens while the window is still invisible.
///
/// Takes the repository and builds its own use cases: they carry no state and
/// no configuration, so injecting them separately would only grow the
/// dependency graph without making anything more testable.
///
/// Note that this bloc does not dispose the captured image — the repository
/// owns it and outlives the bloc.
class ScreenshotBloc({required ScreenshotRepository repository})
    extends Bloc<ScreenshotEvent, ScreenshotState> {
  /// `repository` is a plain parameter rather than a field: only the use case
  /// below needs it, so the bloc does not keep a second reference around.
  final CaptureScreenshot _captureScreenshot = CaptureScreenshot(
    repository: repository,
  );

  this : super(const ScreenshotState.initial()) {
    // `droppable` matters for correctness here, not just for cost. Under the
    // default `concurrent` transformer two captures can be in flight; the
    // second one's result disposes the first one's image in the repository
    // while a `ScreenshotReady` state may still be on screen referencing it,
    // which crashes in `RawImage`. `restartable` would not help either: the
    // native capture cannot be cancelled, so the work happens regardless and
    // only the emit is thrown away.
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
