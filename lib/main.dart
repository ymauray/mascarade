import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mascarade/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    DevicePreview(
      // ignore: avoid_redundant_argument_values
      enabled: !kReleaseMode && !kIsWeb,
      builder: (context) => const ProviderScope(child: App()),
    ),
  );
}
