import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

part 'weight_entry.g.dart';

@HiveType(typeId: 1)
class WeightEntry extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  double? weight;
  @HiveField(2)
  DateTime? dateTime;

  WeightEntry({this.id, this.weight, this.dateTime});

  factory WeightEntry.fromJson(Map<String, dynamic> json) {
    return WeightEntry(
      id: json['id'] as int?,
      weight: json['weight'] as double?,
      dateTime: json['dateTime'] as DateTime?,
    );
  }

  print() {
    debugPrint('id: $id');
    debugPrint('weight: $weight');
    debugPrint('dateTime: $dateTime');
  }

  update(WeightEntry newEntry) {
    id = newEntry.id;
    weight = newEntry.weight;
    dateTime = newEntry.dateTime;
  }
}
