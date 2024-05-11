import 'package:digital_stamp_quiz/common/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DigitalStampQuizApp extends HookWidget {
  const DigitalStampQuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: '2GO Mobile',
    );
  }
}
