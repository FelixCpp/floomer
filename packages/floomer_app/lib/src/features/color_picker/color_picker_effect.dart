import 'package:floomer/src/features/color_picker/color_picker_input.dart';
import 'package:floomer/src/features/color_picker/color_picker_overlay.dart';
import 'package:floomer/src/features/color_picker/color_picker_scope.dart';
import 'package:floomer/src/features/screenshot/domain/entities/screen_capture.dart';
import 'package:flutter/widgets.dart';

class const ColorPickerEffect({
  super.key,
  required final ScreenCapture capture,
  required final Widget child,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ColorPickerScope(
      capture: capture,
      child: ColorPickerInput(
        child: ColorPickerOverlay(child: child),
      ),
    );
  }
}
