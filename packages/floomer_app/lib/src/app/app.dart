import 'package:floomer/src/app/widgets/close_on_escape.dart';
import 'package:floomer/src/app/widgets/window_reveal.dart';
import 'package:floomer/src/core/platform/floomer_method_channel.dart';
import 'package:floomer/src/features/app_window/presentation/app_window_scope.dart';
import 'package:floomer/src/features/screenshot/presentation/pages/screenshot_page.dart';
import 'package:floomer/src/features/screenshot/presentation/screenshot_scope.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

class const FloomerApp({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => const FloomerMethodChannel(),
      child: AppWindowScope(
        child: MaterialApp(
          title: 'floomer',
          debugShowCheckedModeBanner: false,
          home: const ScreenshotScope(
            child: WindowReveal(
              child: CloseOnEscape(child: ScreenshotPage()),
            ),
          ),
        ),
      ),
    );
  }
}
