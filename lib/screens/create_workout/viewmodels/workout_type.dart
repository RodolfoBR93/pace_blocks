class WorkoutType {
  final int? id;
  final String name;
  final String code;

  WorkoutType({this.id, required this.name, required this.code});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'code': code,
    };
  }

  factory WorkoutType.fromMap(Map<String, dynamic> map) {
    return WorkoutType(
      id: map['id'],
      name: map['name'],
      code: map['code'],
    );
  }
}
