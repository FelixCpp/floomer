import 'dart:ui' as ui;

import 'package:floomer/src/features/color_picker/color_picker_controller.dart';
import 'package:floomer/src/features/color_picker/color_picker_scope.dart';
import 'package:flutter/widgets.dart';

const _surface = Color(0xB8101013);
const _hairline = Color(0x24FFFFFF);
const _tabularFigures = [ui.FontFeature.tabularFigures()];

class const ColorPickerOverlay({
  super.key,
  required final Widget child,
}) extends StatefulWidget {
  @override
  State<ColorPickerOverlay> createState() => _ColorPickerOverlayState();
}

class _ColorPickerOverlayState extends State<ColorPickerOverlay> {
  List<Color?>? _lastSample;

  @override
  Widget build(BuildContext context) {
    final controller = ColorPickerScope.of(context, listen: true);
    final sample = controller.sampleAround(_Magnifier.radius);
    if (sample != null) _lastSample = sample;

    final isVisible = controller.isActive && sample != null;

    return LayoutBuilder(
      builder: (context, constraints) {
        final cursor = controller.mousePosition;
        final position = _cardPosition(cursor, constraints.biggest);

        return Stack(
          children: [
            widget.child,
            if (_lastSample case final sample?)
              Positioned(
                left: position.dx,
                top: position.dy,
                child: IgnorePointer(
                  child: AnimatedScale(
                    scale: isVisible ? 1.0 : 0.94,
                    duration: _ColorCard.fadeDuration,
                    curve: Curves.easeOutCubic,
                    alignment: _scaleAlignment(cursor, position),
                    child: AnimatedOpacity(
                      opacity: isVisible ? 1.0 : 0.0,
                      duration: _ColorCard.fadeDuration,
                      curve: Curves.easeOut,
                      child: _ColorCard(
                        sample: sample,
                        lastCopied: controller.lastCopied,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  Offset _cardPosition(Offset cursor, Size bounds) {
    const gap = _ColorCard.cursorGap;
    const size = _ColorCard.size;

    var left = cursor.dx + gap;
    if (left + size.width > bounds.width) left = cursor.dx - gap - size.width;

    var top = cursor.dy + gap;
    if (top + size.height > bounds.height) top = cursor.dy - gap - size.height;

    return .new(left, top);
  }

  Alignment _scaleAlignment(Offset cursor, Offset card) {
    return .new(
      cursor.dx < card.dx ? -1.0 : 1.0,
      cursor.dy < card.dy ? -1.0 : 1.0,
    );
  }
}

class const _ColorCard({
  required final List<Color?> sample,
  required final ColorCode? lastCopied,
}) extends StatelessWidget {
  static const fadeDuration = Duration(milliseconds: 180);
  static const cursorGap = 20.0;

  static const _padding = 10.0;
  static const _infoGap = 10.0;
  static const _footerGap = 9.0;

  static const size = Size(
    _Magnifier.size + _padding * 2,
    _padding +
        _Magnifier.size +
        _infoGap +
        _ColorInfo.swatchSize +
        _footerGap +
        _CopyFooter.height +
        _padding +
        2,
  );

  static final _borderRadius = BorderRadius.circular(16);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: _borderRadius,
        boxShadow: const [
          BoxShadow(
            color: Color(0x66000000),
            blurRadius: 28,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: _borderRadius,
        child: BackdropFilter(
          filter: ui.ImageFilter.blur(sigmaX: 28, sigmaY: 28),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: _surface,
              borderRadius: _borderRadius,
              border: Border.all(color: _hairline, width: 0.5),
            ),
            child: SizedBox.fromSize(
              size: size,
              child: Padding(
                padding: const EdgeInsets.all(_padding),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    _Magnifier(sample: sample),
                    const SizedBox(height: _infoGap),
                    _ColorInfo(color: sample[sample.length ~/ 2]!),
                    const SizedBox(height: _footerGap),
                    _CopyFooter(lastCopied: lastCopied),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class const _Magnifier({required final List<Color?> sample})
    extends StatelessWidget {
  static const radius = 7;
  static const _cells = radius * 2 + 1;
  static const _cellSize = 10.0;
  static const size = _cells * _cellSize;

  static final _borderRadius = BorderRadius.circular(9);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      position: .foreground,
      decoration: BoxDecoration(
        borderRadius: _borderRadius,
        border: Border.all(color: _hairline, width: 0.5),
      ),
      child: ClipRRect(
        borderRadius: _borderRadius,
        child: CustomPaint(
          size: const Size.square(size),
          painter: _MagnifierPainter(
            sample: sample,
            cells: _cells,
            cellSize: _cellSize,
          ),
        ),
      ),
    );
  }
}

class const _ColorInfo({required final Color color}) extends StatelessWidget {
  static const swatchSize = 30.0;

  static const _hexStyle = TextStyle(
    color: Color(0xFFFFFFFF),
    fontSize: 14,
    height: 1.2,
    fontWeight: .w600,
    letterSpacing: 0.6,
    decoration: .none,
    fontFeatures: _tabularFigures,
  );

  static const _rgbStyle = TextStyle(
    color: Color(0x80FFFFFF),
    fontSize: 11,
    height: 1.3,
    letterSpacing: 0.2,
    decoration: .none,
    fontFeatures: _tabularFigures,
  );

  @override
  Widget build(BuildContext context) {
    final (r, g, b) = color.channels;

    return Row(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0x33FFFFFF), width: 0.5),
          ),
          child: const SizedBox.square(dimension: swatchSize),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: FittedBox(
            fit: .scaleDown,
            alignment: .centerLeft,
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text(ColorCode.hex.format(color), style: _hexStyle),
                Text('$r · $g · $b', style: _rgbStyle),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class const _CopyFooter({required final ColorCode? lastCopied})
    extends StatelessWidget {
  static const height = 14.0;

  static const _shortcutStyle = TextStyle(
    color: Color(0xCCFFFFFF),
    fontSize: 11,
    fontWeight: .w600,
    decoration: .none,
  );

  static const _hintStyle = TextStyle(
    color: Color(0x80FFFFFF),
    fontSize: 11,
    decoration: .none,
  );

  static const _confirmationStyle = TextStyle(
    color: Color(0xFFFFFFFF),
    fontSize: 11,
    fontWeight: .w600,
    decoration: .none,
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: FittedBox(
        fit: .scaleDown,
        alignment: .centerLeft,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 140),
          child: switch (lastCopied) {
            final code? => Text(
              '✓  ${code.label} copied',
              key: ValueKey(code),
              style: _confirmationStyle,
            ),
            null => const Row(
              key: ValueKey('hints'),
              mainAxisSize: .min,
              children: [
                Text('⌘C', style: _shortcutStyle),
                Text(' Hex', style: _hintStyle),
                SizedBox(width: 12),
                Text('⇧⌘C', style: _shortcutStyle),
                Text(' RGB', style: _hintStyle),
              ],
            ),
          },
        ),
      ),
    );
  }
}

class _MagnifierPainter({
  required final List<Color?> sample,
  required final int cells,
  required final double cellSize,
}) extends CustomPainter {
  static final _emptyPaint = Paint()..color = const Color(0x0FFFFFFF);

  static final _gridPaint = Paint()
    ..color = const Color(0x14000000)
    ..strokeWidth = 1
    ..isAntiAlias = false;

  static final _outerRingPaint = Paint()
    ..style = .stroke
    ..strokeWidth = 2
    ..color = const Color(0xB3000000);

  static final _innerRingPaint = Paint()
    ..style = .stroke
    ..strokeWidth = 1
    ..color = const Color(0xFFFFFFFF);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(Offset.zero & size, _emptyPaint);

    final cellPaint = Paint()..isAntiAlias = false;
    for (final (index, color) in sample.indexed) {
      if (color == null) continue;

      canvas.drawRect(
        _cellRect(index % cells, index ~/ cells),
        cellPaint..color = color,
      );
    }

    for (var i = 1; i < cells; i++) {
      final offset = i * cellSize;
      canvas
        ..drawLine(Offset(offset, 0), Offset(offset, size.height), _gridPaint)
        ..drawLine(Offset(0, offset), Offset(size.width, offset), _gridPaint);
    }

    final center = _cellRect(cells ~/ 2, cells ~/ 2).inflate(1);
    canvas
      ..drawRect(center, _outerRingPaint)
      ..drawRect(center, _innerRingPaint);
  }

  Rect _cellRect(int column, int row) {
    return .fromLTWH(column * cellSize, row * cellSize, cellSize, cellSize);
  }

  @override
  bool shouldRepaint(_MagnifierPainter oldDelegate) {
    return !identical(sample, oldDelegate.sample);
  }
}
