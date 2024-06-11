class Profile {
  Profile({
    num? id,
    String? cusName,
  }) {
    _id = id;
    _cusName = cusName;
  }

  Profile.fromJson(dynamic json) {
    _id = json['id'];
    _cusName = json['cus_name'];
  }

  num? _id;
  String? _cusName;

  Profile copyWith({
    num? id,
    String? cusName,
  }) =>
      Profile(
        id: id ?? _id,
        cusName: cusName ?? _cusName,
      );

  num? get id => _id;

  String? get cusName => _cusName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['cus_name'] = _cusName;
    return map;
  }
}
