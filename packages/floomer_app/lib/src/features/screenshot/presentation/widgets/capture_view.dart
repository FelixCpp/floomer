import 'package:floomer/src/features/flashlight/flashlight_effect.dart';
import 'package:floomer/src/features/flashlight/flashlight_scope.dart';
import 'package:floomer/src/features/mirroring/mirroring_effect.dart';
import 'package:floomer/src/features/screenshot/domain/entities/screen_capture.dart';
import 'package:material_ui/material_ui.dart';

class const CaptureView({
  required final ScreenCapture screenshot,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlashlightEffect(
      child: Builder(
        builder: (context) {
          final canResizeLight = FlashlightScope.of(context).canResizeLight;

          return InteractiveViewer(
            scaleEnabled: !canResizeLight,
            panEnabled: !canResizeLight,
            trackpadScrollCausesScale: true,
            minScale: 0.1,
            maxScale: 100.0,
            boundaryMargin: .all(.infinity),
            child: MirroringEffect(
              child: RawImage(
                image: screenshot.image,
                scale: screenshot.scale,
                fit: .fill,
                filterQuality: .none,
              ),
            ),
          );
        },
      ),
    );
  }
}
