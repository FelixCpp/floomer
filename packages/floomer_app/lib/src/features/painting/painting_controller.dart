import 'package:flutter/widgets.dart';

class PaintingController extends ChangeNotifier {
  final _strokes = <List<Offset>>[];
  List<Offset>? _currentStroke;

  List<List<Offset>> get strokes => _strokes;

  bool get isPainting => _currentStroke != null;

  void startStroke(Offset point) {
    final stroke = [point];
    _currentStroke = stroke;
    _strokes.add(stroke);
    notifyListeners();
  }

  void addPoint(Offset point) {
    final stroke = _currentStroke;
    if (stroke == null) return;
    stroke.add(point);
    notifyListeners();
  }

  void endStroke() {
    if (_currentStroke == null) return;
    _currentStroke = null;
    notifyListeners();
  }

  void clear() {
    _strokes.clear();
    _currentStroke = null;
    notifyListeners();
  }
}
