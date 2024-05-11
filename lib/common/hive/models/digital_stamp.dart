import 'package:hive/hive.dart';

part 'digital_stamp.g.dart';

@HiveType(typeId: 0)
class DigitalStamp {
  @HiveField(0)
  String name;

  @HiveField(1)
  int questionIndex;

  @HiveField(2)
  List<StampItem> items;

  DigitalStamp(
      {required this.name, required this.questionIndex, required this.items});

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

@HiveType(typeId: 1)
class StampItem {
  @HiveField(0)
  int stampIndex;

  @HiveField(1)
  String createdDate;

  @HiveField(2)
  bool isSigned;

  StampItem(
      {required this.stampIndex,
      required this.createdDate,
      required this.isSigned});

  factory StampItem.fromJson(Map<String, dynamic> json) {
    return StampItem(
      stampIndex: json['stampIndex'],
      createdDate: json['createdDate'],
      isSigned: json['isSigned'],
    );
  }
}
