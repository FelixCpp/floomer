import 'package:floomer/src/features/mirroring/mirroring_scope.dart';
import 'package:flutter/widgets.dart';

class const MirroringInput({
  super.key,
  required final Widget child,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CallbackShortcuts(
      bindings: {
        SingleActivator(.keyM): () => MirroringScope.of(context).toggle(),
      },
      child: FocusScope(
        child: Focus(
          autofocus: true,
          child: child,
        ),
      ),
    );
  }
}
