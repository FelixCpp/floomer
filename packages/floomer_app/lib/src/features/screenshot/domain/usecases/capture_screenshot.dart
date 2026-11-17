import 'package:floomer/src/features/screenshot/domain/entities/screenshot.dart';
import 'package:floomer/src/features/screenshot/domain/failures/screenshot_failure.dart';
import 'package:floomer/src/features/screenshot/domain/repositories/screenshot_repository.dart';

/// Captures the display the cursor is currently on.
///
/// Throws a [ScreenshotFailure].
class const CaptureScreenshot({
  required final ScreenshotRepository _repository,
}) {
  Future<Screenshot> call() => _repository.capture();
}
