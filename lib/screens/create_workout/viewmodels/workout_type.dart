class WorkoutType {
  final int? id;
  final String name;
  final String code;
  final String locale;

  WorkoutType({this.id, required this.name, required this.code, required this.locale});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'code': code,
      'locale_id': locale,
    };
  }

  factory WorkoutType.fromMap(Map<String, dynamic> map) {
    return WorkoutType(
      id: map['id'],
      name: map['name'],
      code: map['code'],
      locale: map['locale_id'],
    );
  }
}
