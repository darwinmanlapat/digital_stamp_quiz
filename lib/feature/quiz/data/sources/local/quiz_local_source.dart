import 'dart:convert';

import 'package:digital_stamp_quiz/common/constants/local_storage_keys.dart';
import 'package:digital_stamp_quiz/common/hive/models/digital_stamp.dart';
import 'package:digital_stamp_quiz/common/services/hive_storage_service.dart';
import 'package:digital_stamp_quiz/feature/quiz/domain/entities/quiz_category_entity.dart';
import 'package:flutter/services.dart';

class QuizLocalSource {
  const QuizLocalSource(HiveStorageService hiveStorage)
      : _hiveStorage = hiveStorage;

  final HiveStorageService _hiveStorage;

  Future<List<QuizCategory>> getQuizCategories() async {
    dynamic digitalStamps =
        await _hiveStorage.getData(LocalStorageKeys.digitalStamps);
    final jsonFile = await rootBundle.loadString(
      'assets/jsons/quiz-category.json',
    );
    final jsonData = jsonDecode(jsonFile);

    // Stores digital stamps if non-existent on local device storage.
    if (digitalStamps == null) {
      List<DigitalStamp> stamps = (jsonData as List<dynamic>)
          .map((stampData) => stampData['digitalStamp'])
          .map((e) => DigitalStamp.fromJson(e))
          .toList();

      await _hiveStorage.addData(LocalStorageKeys.digitalStamps, stamps);
    }

    final data = (jsonData as List<dynamic>)
        .map((e) => Map<String, dynamic>.from(e))
        .map((e) => QuizCategory.fromJson(e))
        .toList();

    return data;
  }

  Future<DigitalStamp> getDigitalStampPerCategory(
    String categoryName,
  ) async {
    final digitalStamps =
        await _hiveStorage.getData(LocalStorageKeys.digitalStamps);

    DigitalStamp stamp = digitalStamps
        .firstWhere((stamp) => stamp.name == categoryName, orElse: () => null);

    return stamp;
  }

  Future<void> updateQuizStampsPerCategory(String categoryName) async {
    throw UnimplementedError();
  }
}
