import 'package:floomer/src/features/screenshot/domain/entities/screenshot.dart';
import 'package:floomer/src/features/screenshot/domain/repositories/screenshot_repository.dart';

class const CaptureScreenshot(final ScreenshotRepository _repository) {
  Future<Screenshot> call() {
    return _repository.capture();
  }
}
