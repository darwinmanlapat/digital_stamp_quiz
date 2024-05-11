import 'package:digital_stamp_quiz/feature/quiz/domain/entities/stamp_item_entity.dart';

class DigitalStamp {
  final String name;
  final int questionIndex;
  final List<StampItem> items;

  DigitalStamp({
    required this.name,
    required this.questionIndex,
    required this.items,
  });

  factory DigitalStamp.fromJson(Map<String, dynamic> json) {
    return DigitalStamp(
      name: json['name'],
      questionIndex: json['questionIndex'],
      items: (json['items'] as List)
          .map((e) => Map<String, dynamic>.from(e))
          .map((itemJson) => StampItem.fromJson(itemJson))
          .toList(),
    );
  }
}
