import 'package:floomer/src/features/flashlight/flashlight_effect.dart';
import 'package:floomer/src/features/flashlight/flashlight_input.dart';
import 'package:floomer/src/features/flashlight/flashlight_scope.dart';
import 'package:floomer/src/features/screenshot/domain/entities/screen_capture.dart';
import 'package:material_ui/material_ui.dart';

class const CaptureView({
  required final ScreenCapture screenshot,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlashlightScope(
      child: FlashlightInput(
        child: FlashlightEffect(
          child: Builder(
            builder: (context) {
              // While resizing the light, scroll gestures must not move or
              // zoom the image.
              final canResizeLight = FlashlightScope.of(context).canResizeLight;

              return InteractiveViewer(
                scaleEnabled: !canResizeLight,
                panEnabled: !canResizeLight,
                trackpadScrollCausesScale: true,
                minScale: 0.1,
                maxScale: 100.0,
                child: RawImage(
                  image: screenshot.image,
                  scale: screenshot.scale,
                  fit: .cover,
                  filterQuality: .none,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
