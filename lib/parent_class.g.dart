// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parent_class.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ParentClassAdapter extends TypeAdapter<ParentClass> {
  @override
  final int typeId = 0;

  @override
  ParentClass read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ParentClass(
      parentName: fields[0] as String,
      subClass: fields[1] as SubClass,
    );
  }

  @override
  void write(BinaryWriter writer, ParentClass obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.parentName)
      ..writeByte(1)
      ..write(obj.subClass);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ParentClassAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SubClassAdapter extends TypeAdapter<SubClass> {
  @override
  final int typeId = 1;

  @override
  SubClass read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SubClass(
      childName: fields[0] as String,
      childAge: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, SubClass obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.childName)
      ..writeByte(1)
      ..write(obj.childAge);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubClassAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
