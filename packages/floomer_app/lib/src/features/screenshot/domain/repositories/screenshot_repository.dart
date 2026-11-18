import 'package:floomer/src/features/screenshot/domain/entities/screen_capture.dart';

abstract interface class ScreenshotRepository {
  ScreenCapture? get current;
  Future<ScreenCapture> capture();
  void dispose();
}
