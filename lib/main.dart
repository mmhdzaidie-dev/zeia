import 'dart:io';
import 'package:flutter/material.dart';
import 'app.dart';
import 'services/player_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  late ZeiaPlayerHandler handler;
  if (Platform.isWindows) {
    handler = ZeiaPlayerHandler();
  } else {
    handler = await createAudioHandler();
  }
  runApp(ZeiaApp(player: handler));
}
