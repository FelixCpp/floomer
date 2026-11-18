import 'package:floomer/src/app/app.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_shaders/flutter_shaders.dart';

Future<void> main() async {
  await ShaderBuilder.precacheShader('assets/shaders/flashlight_shader.glsl');

  runApp(const FloomerApp());
}
