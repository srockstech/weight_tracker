class WeightEntry {
  int? id;
  double? weight;
  DateTime? dateTime;

  WeightEntry({this.id, this.weight, this.dateTime});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'weight': weight,
      'dateTime': dateTime!.toIso8601String()
    };
  }

  @override
  String toString() {
    return 'WeightEntry{id: $id, weight: $weight, dateTime: $dateTime}';
  }
}
