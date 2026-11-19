import 'dart:math' as math;

import 'package:flutter/widgets.dart';

class FlashlightController extends ChangeNotifier {
  var isActive = false;
  var mousePosition = Offset.zero;
  var lightRadius = 140.0;
  var lightSoftness = 60.0;

  var isChangingLightRadius = false;

  static const _minLightRadius = 20.0;
  static const _maxLightRadius = 1000.0;
  static const _scrollScaleFactor = 200.0;

  bool get canResizeLight => isActive && isChangingLightRadius;

  void setLightRadiusChange(bool isChanging) {
    if (isChanging == isChangingLightRadius) return;
    isChangingLightRadius = isChanging;
    notifyListeners();
  }

  void scaleLightRadius(double scrollDelta) {
    lightRadius = (lightRadius * math.exp(-scrollDelta / _scrollScaleFactor))
        .clamp(_minLightRadius, _maxLightRadius);
    notifyListeners();
  }

  void setMousePosition(double mouseX, double mouseY) {
    mousePosition = .new(mouseX, mouseY);
    notifyListeners();
  }

  void toggle() {
    isActive = !isActive;
    notifyListeners();
  }
}
