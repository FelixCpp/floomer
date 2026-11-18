import 'package:material_ui/material_ui.dart';

class const CenteredMessage({
  required final String title,
  required final String body,
  required final List<Widget> actions,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: Column(
            mainAxisAlignment: .center,
            spacing: 16,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: .center,
              ),
              Text(body, textAlign: .center),
              Row(mainAxisAlignment: .center, spacing: 8, children: actions),
            ],
          ),
        ),
      ),
    );
  }
}
