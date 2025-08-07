class UnitType {
  final int? id;
  final String name;
  final int locale;

  UnitType({this.id, required this.name, required this.locale});

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'locale_id': locale};
  }

  factory UnitType.fromMap(Map<String, dynamic> map) {
    return UnitType(
      id: map['id'],
      name: map['name'],
      locale: map['locale_id'],
    );
  }
}
