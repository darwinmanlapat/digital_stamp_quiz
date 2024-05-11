// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'digital_stamp.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DigitalStampAdapter extends TypeAdapter<DigitalStamp> {
  @override
  final int typeId = 0;

  @override
  DigitalStamp read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DigitalStamp(
      name: fields[0] as String,
      questionIndex: fields[1] as int,
      items: (fields[2] as List).cast<StampItem>(),
    );
  }

  @override
  void write(BinaryWriter writer, DigitalStamp obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.questionIndex)
      ..writeByte(2)
      ..write(obj.items);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DigitalStampAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class StampItemAdapter extends TypeAdapter<StampItem> {
  @override
  final int typeId = 1;

  @override
  StampItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StampItem(
      stampIndex: fields[0] as int,
      createdDate: fields[1] as String,
      isSigned: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, StampItem obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.stampIndex)
      ..writeByte(1)
      ..write(obj.createdDate)
      ..writeByte(2)
      ..write(obj.isSigned);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StampItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
