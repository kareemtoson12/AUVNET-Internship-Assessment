import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:nawel/data/services/firebase_init_data.dart';

import 'firebase_options.dart';
import 'app/app.dart';

import 'data/services/local_storage_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Initialize Hive for local storage
  await LocalStorageService.init();

  await pushDummyServicesToFirestore();

  runApp(const App());
}
