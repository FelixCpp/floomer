import 'dart:ui' as ui;

import 'package:floomer/src/features/flashlight/flashlight_scope.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_shaders/flutter_shaders.dart';

class const FlashlightShader({
  super.key,
  required final Widget child,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ShaderBuilder(
      (context, shader, child) {
        final controller = FlashlightScope.of(context);
        final pixelRatio = MediaQuery.devicePixelRatioOf(context);
        final mousePosition = controller.mousePosition * pixelRatio;
        final lightRadius = controller.lightRadius * pixelRatio;
        final lightSoftness = controller.lightSoftness * pixelRatio;

        final uMouse = shader.getUniformVec2("uMouse");
        final uRadius = shader.getUniformFloat("uRadius");
        final uSoftness = shader.getUniformFloat("uSoftness");

        uMouse.set(mousePosition.dx, mousePosition.dy);
        uRadius.set(lightRadius);
        uSoftness.set(lightSoftness);

        return ImageFiltered(
          imageFilter: ui.ImageFilter.shader(shader),
          enabled: controller.isActive,
          child: ColoredBox(
            color: Color(0xFF000000),
            child: child,
          ),
        );
      },
      assetKey: 'assets/shaders/flashlight_shader.glsl',
      child: child,
    );
  }
}
