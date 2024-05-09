import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class User extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? userName;
  @HiveField(2)
  List<int>? weightEntries;

  User({this.id, this.userName, this.weightEntries});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int?,
      userName: json['userName'] as String?,
      weightEntries: json['weightEntries'] as List<int>?,
    );
  }

  print() {
    debugPrint('id: $id');
    debugPrint('userName: $userName');
    debugPrint('weightEntries: $weightEntries');
  }
}
