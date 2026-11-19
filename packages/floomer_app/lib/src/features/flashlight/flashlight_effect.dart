import 'package:floomer/src/features/flashlight/flashlight_input.dart';
import 'package:floomer/src/features/flashlight/flashlight_scope.dart';
import 'package:floomer/src/features/flashlight/flashlight_shader.dart';
import 'package:flutter/widgets.dart';

class const FlashlightEffect({
  super.key,
  required final Color backgroundColor,
  required final Widget child,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlashlightScope(
      child: FlashlightInput(
        child: FlashlightShader(
          backgroundColor: backgroundColor,
          child: child,
        ),
      ),
    );
  }
}
