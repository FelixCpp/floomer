import 'package:floomer/src/features/screenshot/domain/entities/screenshot.dart';
import 'package:floomer/src/features/screenshot/domain/failures/screenshot_failure.dart';

/// Takes screenshots and owns the decoded result.
///
/// The capture outlives the bloc that requested it — annotation and export will
/// both read the same image — so ownership sits in the repository and is
/// released through [dispose].
abstract interface class ScreenshotRepository {
  /// The most recent capture, or `null` if none succeeded yet.
  Screenshot? get current;

  /// Captures the display the cursor is currently on.
  ///
  /// Throws a [ScreenshotFailure].
  Future<Screenshot> capture();

  /// Releases the decoded capture.
  void dispose();
}
