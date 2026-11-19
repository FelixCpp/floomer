import 'package:floomer/src/features/color_picker/color_picker_indicator.dart';
import 'package:floomer/src/features/color_picker/color_picker_input.dart';
import 'package:floomer/src/features/color_picker/color_picker_scope.dart';
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
    return ColorPickerScope(
      image: screenshot.image,
      scale: screenshot.scale,
      child: ColorPickerIndicator(
        child: FlashlightEffect(
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
                constrained: false,
                child: MirroringEffect(
                  // InteractiveViewer forces its child to the viewport size.
                  // OverflowBox lifts that limit, so the SizedBox always gets
                  // the image's size, even when the window is smaller than the
                  // captured display, and positions map 1:1 to pixels.
                  child: OverflowBox(
                    maxWidth: .infinity,
                    maxHeight: .infinity,
                    child: ColorPickerInput(
                      child: SizedBox(
                        width: screenshot.logicalSize.width,
                        height: screenshot.logicalSize.height,
                        child: RawImage(
                          image: screenshot.image,
                          scale: screenshot.scale,
                          filterQuality: .none,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
