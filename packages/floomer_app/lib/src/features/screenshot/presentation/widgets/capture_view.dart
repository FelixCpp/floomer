import 'package:floomer/src/features/background_color/presentation/widgets/background_color_builder.dart';
import 'package:floomer/src/features/flashlight/flashlight_effect.dart';
import 'package:floomer/src/features/flashlight/flashlight_scope.dart';
import 'package:floomer/src/features/mirroring/mirroring_effect.dart';
import 'package:floomer/src/features/mirroring/mirroring_scope.dart';
import 'package:floomer/src/features/painting/painting_effect.dart';
import 'package:floomer/src/features/painting/painting_input.dart';
import 'package:floomer/src/features/painting/painting_scope.dart';
import 'package:floomer/src/features/screenshot/domain/entities/screen_capture.dart';
import 'package:material_ui/material_ui.dart';

class const CaptureView({
  required final ScreenCapture screenshot,
  super.key,
}) extends StatefulWidget {
  @override
  State<CaptureView> createState() => _CaptureViewState();
}

class _CaptureViewState extends State<CaptureView> {
  late final TransformationController _transformationController;

  @override
  void initState() {
    super.initState();
    _transformationController = TransformationController();
  }

  @override
  void dispose() {
    _transformationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MirroringScope(
      child: PaintingScope(
        child: PaintingKeyboardInput(
          child: PaintingEffect(
            transformationController: _transformationController,
            child: BackgroundColorBuilder(
              builder: (context, backgroundColor, child) => FlashlightEffect(
                backgroundColor: backgroundColor,
                child: child!,
              ),
              child: Builder(
                builder: (context) {
                  final canResizeLight = FlashlightScope.of(
                    context,
                  ).canResizeLight;
                  final isPainting = PaintingScope.of(context).isPainting;

                  return InteractiveViewer(
                    transformationController: _transformationController,
                    scaleEnabled: !canResizeLight,
                    panEnabled: !canResizeLight && !isPainting,
                    trackpadScrollCausesScale: true,
                    minScale: 0.1,
                    maxScale: 100.0,
                    boundaryMargin: .all(.infinity),
                    child: MirroringEffect(
                      child: PaintingPointerInput(
                        child: RawImage(
                          image: widget.screenshot.image,
                          scale: widget.screenshot.scale,
                          fit: .fill,
                          filterQuality: .none,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
