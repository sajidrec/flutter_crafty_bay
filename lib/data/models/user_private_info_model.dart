class UserPrivateInfoModel {
  UserPrivateInfoModel({
    num? id,
    String? email,
    String? otp,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _email = email;
    _otp = otp;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  UserPrivateInfoModel.fromJson(dynamic json) {
    _id = json['id'];
    _email = json['email'];
    _otp = json['otp'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  num? _id;
  String? _email;
  String? _otp;
  String? _createdAt;
  String? _updatedAt;

  UserPrivateInfoModel copyWith({
    num? id,
    String? email,
    String? otp,
    String? createdAt,
    String? updatedAt,
  }) =>
      UserPrivateInfoModel(
        id: id ?? _id,
        email: email ?? _email,
        otp: otp ?? _otp,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );

  num? get id => _id;

  String? get email => _email;

  String? get otp => _otp;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['email'] = _email;
    map['otp'] = _otp;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
