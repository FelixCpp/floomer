import 'dart:async';
import 'dart:ui' as ui;

import 'package:material_ui/material_ui.dart';

/// Lays a list of floomer's shortcuts over [child].
///
/// Every control is a key or a mouse button with nothing on screen pointing at
/// it, so the list shows itself once on startup and fades out again. `H`
/// brings it back at any time.
class const ShortcutOverlay({
  required final Widget child,
  super.key,
}) extends StatefulWidget {
  /// How long the list stays up on startup before fading out on its own.
  static const Duration _initialDuration = Duration(seconds: 5);

  @override
  State<ShortcutOverlay> createState() => _ShortcutOverlayState();
}

class _ShortcutOverlayState extends State<ShortcutOverlay> {
  bool _isVisible = true;
  Timer? _hideTimer;

  @override
  void initState() {
    super.initState();
    _hideTimer = Timer(
      ShortcutOverlay._initialDuration,
      () => setState(() => _isVisible = false),
    );
  }

  @override
  void dispose() {
    _hideTimer?.cancel();
    super.dispose();
  }

  void _toggle() {
    // Once it is operated by hand, the startup timer must not interfere.
    _hideTimer?.cancel();
    setState(() => _isVisible = !_isVisible);
  }

  @override
  Widget build(BuildContext context) {
    return CallbackShortcuts(
      bindings: {
        const SingleActivator(.keyH): _toggle,
      },
      child: Stack(
        fit: .expand,
        children: [
          widget.child,
          Positioned(
            left: 28,
            bottom: 28,
            child: IgnorePointer(
              child: AnimatedSlide(
                offset: _isVisible ? .zero : const Offset(0, 0.04),
                duration: _ShortcutCard.fadeDuration,
                curve: Curves.easeOutCubic,
                child: AnimatedOpacity(
                  opacity: _isVisible ? 1.0 : 0.0,
                  duration: _ShortcutCard.fadeDuration,
                  curve: Curves.easeOut,
                  child: const _ShortcutCard(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Frosted panel listing every control, grouped by what it belongs to.
///
/// It floats above a screenshot of an unknown desktop, so it brings its own
/// dark palette instead of following the theme, and its own [DefaultTextStyle]
/// instead of inheriting one — outside a [Material], that would be the
/// bright red fallback style with the yellow underline.
class const _ShortcutCard() extends StatelessWidget {
  static const Duration fadeDuration = Duration(milliseconds: 240);

  static const double _width = 356;
  static const double _keyColumnWidth = 132;
  static const double _keyGutter = 16;

  static final BorderRadius _radius = BorderRadius.circular(16);

  static const Color _surface = Color(0xB8101013);
  static const Color _hairline = Color(0x24FFFFFF);

  static const TextStyle _baseStyle = TextStyle(
    color: Color(0xFFFFFFFF),
    fontSize: 13,
    height: 1.4,
    fontWeight: .w400,
    decoration: .none,
  );

  static const TextStyle _titleStyle = TextStyle(
    color: Color(0xFFFFFFFF),
    fontSize: 14,
    fontWeight: .w600,
    letterSpacing: 0.2,
  );

  static const TextStyle _headingStyle = TextStyle(
    color: Color(0x73FFFFFF),
    fontSize: 10,
    fontWeight: .w600,
    letterSpacing: 1.3,
  );

  static const TextStyle _descriptionStyle = TextStyle(
    color: Color(0xCCFFFFFF),
    fontSize: 13,
  );

  static const TextStyle _hintStyle = TextStyle(
    color: Color(0x80FFFFFF),
    fontSize: 11.5,
  );

  /// Controls grouped by what they act on, each as the keys to press and what
  /// pressing them does.
  static const List<(String, List<(List<String>, String)>)> _groups = [
    (
      'View',
      [
        (['Scroll'], 'Zoom in and out'),
        (['Drag'], 'Move the image'),
        (['M'], 'Mirror at the cursor'),
        (['0'], 'Reset zoom, pan and mirroring'),
      ],
    ),
    (
      'Flashlight',
      [
        (['F'], 'Turn the light on or off'),
        (['Shift', 'Scroll'], 'Resize the light'),
      ],
    ),
    (
      'Drawing',
      [
        (['Right', 'Drag'], 'Draw on the image'),
        (['Cmd', 'Z'], 'Undo the last stroke'),
        (['C'], 'Clear the drawing'),
      ],
    ),
    (
      'floomer',
      [
        (['H'], 'Show or hide this list'),
        (['Esc'], 'Quit'),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      // Outside the clip, so the shadow is not cut off by it.
      decoration: BoxDecoration(
        borderRadius: _radius,
        boxShadow: const [
          BoxShadow(
            color: Color(0x66000000),
            blurRadius: 36,
            offset: Offset(0, 14),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: _radius,
        child: BackdropFilter(
          filter: ui.ImageFilter.blur(sigmaX: 28, sigmaY: 28),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: _surface,
              borderRadius: _radius,
              border: Border.all(color: _hairline, width: 0.5),
            ),
            child: DefaultTextStyle(
              style: _baseStyle,
              child: SizedBox(
                width: _width,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 16, 20, 18),
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      _header(),
                      for (final (heading, entries) in _groups)
                        _group(heading, entries),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          const Text('Shortcuts', style: _titleStyle),
          const Spacer(),
          const Text('H to hide', style: _hintStyle),
        ],
      ),
    );
  }

  Widget _group(String heading, List<(List<String>, String)> entries) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 8),
          child: Row(
            children: [
              Text(heading.toUpperCase(), style: _headingStyle),
              const SizedBox(width: 10),
              const Expanded(child: _Divider()),
            ],
          ),
        ),
        for (final (keys, description) in entries)
          Padding(
            padding: const EdgeInsets.only(bottom: 7),
            child: Row(
              children: [
                SizedBox(
                  width: _keyColumnWidth,
                  // The column is wide enough for every combination in a
                  // normal font, but scaling down beats overflowing if a
                  // label, a font or a text scale ever outgrows it.
                  child: FittedBox(
                    fit: .scaleDown,
                    alignment: .centerRight,
                    child: Row(
                      mainAxisSize: .min,
                      children: [
                        for (final (index, key) in keys.indexed) ...[
                          if (index > 0) const _KeyJoiner(),
                          _Keycap(label: key),
                        ],
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: _keyGutter),
                Expanded(
                  child: Text(description, style: _descriptionStyle),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

/// A single key or mouse button, drawn like a keycap.
class const _Keycap({required final String label}) extends StatelessWidget {
  static const TextStyle _style = TextStyle(
    color: Color(0xFFF5F5F7),
    fontSize: 11.5,
    fontWeight: .w600,
    letterSpacing: 0.3,
  );

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: const Color(0x1FFFFFFF),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: const Color(0x33FFFFFF), width: 0.5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
        child: Text(label, style: _style),
      ),
    );
  }
}

/// The `+` between two keycaps that belong to the same shortcut.
class const _KeyJoiner() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: Text(
        '+',
        style: TextStyle(color: Color(0x73FFFFFF), fontSize: 11),
      ),
    );
  }
}

/// Hairline that trails a group heading out to the edge of the card.
class const _Divider() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(color: Color(0x14FFFFFF)),
      child: SizedBox(height: 1, width: double.infinity),
    );
  }
}
