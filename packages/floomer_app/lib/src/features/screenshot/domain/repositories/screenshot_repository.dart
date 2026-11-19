import 'package:floomer/src/features/screenshot/domain/entities/screen_capture.dart';

abstract interface class ScreenshotRepository {
  ScreenCapture? get current;

  /// Emits every successful capture. Broadcast, so it does not replay the
  /// latest one: listeners that start late should begin with [current].
  Stream<ScreenCapture> get captures;

  Future<ScreenCapture> capture();
  void dispose();
}
