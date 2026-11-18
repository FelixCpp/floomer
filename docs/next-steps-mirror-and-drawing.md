# Nächste Schritte: Spiegeln und Zeichnen

Notizen vom 18.11.2026. Die Taschenlampe ist fertig: Scope, Controller,
Effekt, Eingabe und Größenänderung mit Shift + Scrollen (Mausrad und Trackpad).

## Offene Fragen

- Nur horizontal spiegeln (links/rechts tauschen) oder auch vertikal?
- Soll die Zeichnung vom Licht abgedunkelt werden oder immer voll sichtbar sein?

## Feature 1: Spiegeln relativ zum Cursor (klein, ein paar Stunden)

**Idee:** Spiegelung an der senkrechten Achse durch den Cursor. Der Punkt
unter dem Cursor bleibt, wo er ist, alles links davon klappt nach rechts.

Mathe: zum Cursor verschieben → spiegeln (x × −1) → zurückverschieben. Die
Schritte als Matrizen hintereinander hängen. Zwei Spiegelungen an
verschiedenen Stellen ergeben zusammen eine reine Verschiebung, das muss man
nicht selbst ausrechnen.

**Wo die Spiegelung hingehört (zwei Möglichkeiten):**

1. **In der `TransformationController`-Matrix des `InteractiveViewer`**
   - Elegant: Pannen und Zoomen laufen direkt mit dem gespiegelten Bild
     weiter.
   - Risiko: Der Viewer begrenzt, wie weit das Bild verschoben werden darf,
     und rechnet dafür mit seiner Matrix. Mit negativer Skalierung kann das
     seltsam reagieren → ausprobieren.
2. **Als eigenes `Transform` um den Viewer** (innerhalb des
   `FlashlightEffect`), Spiegel-Zustand in einem eigenen Controller
   - Robuster, weil der Viewer davon nichts mitbekommt.
   - Pannen fühlt sich trotzdem richtig an, weil Flutter auch die
     Maus-Eingaben durch die Spiegelung umrechnet.

**Empfehlung:** mit Variante 2 anfangen. Das Licht ist nicht betroffen, es
liegt außerhalb und folgt weiter dem Cursor. Eine kurze Klapp-Animation ist
optional.

## Feature 2: Auf dem Bild zeichnen (mittel, mit offenem Ende nach oben)

Grundversion (Freihand, eine Farbe, alles löschen): etwa ein Tag.

### 1. Koordinaten (wichtigster Punkt)

Striche sollen am *Bild* kleben und beim Pannen, Zoomen und Spiegeln
mitwandern:

- Punkte in **Bild-Koordinaten** speichern (`TransformationController.toScene`).
- Mit einem `CustomPainter` **innerhalb** des `InteractiveViewer` zeichnen,
  in einem `Stack` über dem `RawImage` → der Viewer übernimmt Verschiebung
  und Zoom automatisch.

### 2. Zeichnen oder Pannen?

Ziehen mit der Maus verschiebt das Bild → es braucht einen Modus, gleiches
Muster wie beim Resizen: Solange eine Taste gedrückt bzw. ein Zeichen-Modus
aktiv ist, `panEnabled: false` setzen und die Punkte im `Listener` sammeln.

### 3. Strichstärke

Bei 10-fachem Zoom gezeichnete Striche werden beim Herauszoomen sehr dünn.
Für eine feste Bildschirm-Dicke die Stärke beim Zeichnen durch den aktuellen
Zoom teilen.

### 4. Licht und Zeichnung

Die Zeichnung liegt unter dem Effekt und wird deshalb mit abgedunkelt. Falls
das nicht gewollt ist, muss die Zeichenebene über den Effekt, und die
Viewer-Matrix muss von Hand auf sie angewendet werden.

### Was es schnell größer macht

- Undo/Redo (Cmd+Z): wenig Aufwand, wenn Striche eine einfache Liste sind
- Werkzeuge (Pfeil, Rechteck, Textmarker): pro Werkzeug etwas Arbeit
- Striche glätten: Bézier-Kurven statt gerader Linien zwischen den Punkten
- Bild samt Zeichnung exportieren/kopieren: `RepaintBoundary.toImage` +
  Zwischenablage auf macOS, ein eigenes Thema

**Struktur:** ein eigener `DrawingController` (+ Scope) nach dem gleichen
Muster wie beim Flashlight, statt alles in einen Controller zu packen.

## Offene Punkte im Flashlight-Code

- `print("Hier …")` / `print("Da …")` in
  `FlashlightController.setLightRadiusChange` entfernen.
- `isActive` steht noch auf `true` (war zum Testen) → wieder auf `false`.
- `setMousePosition` ruft immer `notifyListeners()` auf → sofort
  zurückkehren, wenn sich der Wert nicht ändert.
- Die öffentlichen `var`-Felder im Controller privat machen und nur Getter
  nach außen geben.
- `FlashlightInput` holt den Controller mit `of` (`dependOn…`) und baut sich
  bei jeder Mausbewegung neu → eine `read`-Variante
  (`getInheritedWidgetOfExactType`) im Scope ergänzen.
- Die Weichheit des Lichts ist fest bei 60 px → evtl. als Anteil vom Radius.
- Faktor (200) und Grenzen (20–1000) beim Resizen nachjustieren; das
  Trackpad braucht evtl. einen eigenen Faktor.
- Prüfen, ob die Multiplikation mit `devicePixelRatio` im `FlashlightEffect`
  stimmt (Licht auf dem Retina-Display versetzt oder zu groß?).
- Bis zur ersten Mausbewegung steht das Licht bei `Offset.zero` (oben links).
