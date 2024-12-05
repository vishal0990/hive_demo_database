import 'dart:typed_data';
import 'package:hive/hive.dart';

part 'parent_class.g.dart';

@HiveType(typeId: 0) // Unique type ID for ParentClass
class ParentClass {
  @HiveField(0)
  final String parentName;

  @HiveField(1)
  final SubClass subClass;

  @HiveField(2) // New field for image
  final Uint8List? image; // Optional image data

  ParentClass({required this.parentName, required this.subClass, this.image});
}

@HiveType(typeId: 1) // Unique type ID for SubClass
class SubClass {
  @HiveField(0)
  final String childName;

  @HiveField(1)
  final int childAge;

  SubClass({required this.childName, required this.childAge});
}
