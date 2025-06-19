import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nawel/app/app.dart';
import 'package:nawel/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

import 'data/services/local_storage_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Initialize Hive for local storage
  await LocalStorageService.init();

  //await pushDummyServicesToFirestore();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode, // Enable device preview in debug mode only
      builder: (context) => const App(), // Wrap your app
    ),
  );
}
