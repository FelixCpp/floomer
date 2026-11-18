import 'package:floomer/src/features/screenshot/domain/entities/screen_capture.dart';
import 'package:floomer/src/features/screenshot/domain/repositories/screenshot_repository.dart';
import 'package:use_in_case/use_in_case.dart';

class const CaptureScreenshot(
  final ScreenshotRepository _repository,
) implements ResultInteractor<ScreenCapture> {
  @override
  Future<ScreenCapture> execute(NoInput _) {
    return _repository.capture();
  }
}
