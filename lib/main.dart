import 'package:digital_stamp_quiz/app.dart';
import 'package:digital_stamp_quiz/common/constants/local_storage_keys.dart';
import 'package:digital_stamp_quiz/common/services/hive_storage_service.dart';
import 'package:digital_stamp_quiz/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  // Ensure Flutter binding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Set preferred device orientation
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  // Set up service locators
  setUpLocators();

  // Initialize local storage service
  final hiveLocalStorage = locator.get<HiveStorageService>();
  await hiveLocalStorage.init(LocalStorageKeys.boxName);
  

  runApp(
    const ProviderScope(
      child: DigitalStampQuizApp(),
    ),
  );
}
