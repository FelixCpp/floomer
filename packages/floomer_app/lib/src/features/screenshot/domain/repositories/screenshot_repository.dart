import 'package:floomer/src/features/screenshot/domain/entities/screenshot.dart';

abstract interface class ScreenshotRepository {
  Screenshot? get current;
  Future<Screenshot> capture();
  void dispose();
}
