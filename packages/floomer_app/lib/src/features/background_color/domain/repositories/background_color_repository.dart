import 'dart:ui' as ui;

abstract interface class BackgroundColorRepository {
  ui.Color? get current;
  Stream<ui.Color> get colors;
  void dispose();
}
