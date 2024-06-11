import 'package:crafty_bay/data/models/profile_model.dart';

class ReviewModel {
  ReviewModel({
    num? id,
    String? description,
    String? rating,
    num? customerId,
    num? productId,
    String? createdAt,
    String? updatedAt,
    Profile? profile,
  }) {
    _id = id;
    _description = description;
    _rating = rating;
    _customerId = customerId;
    _productId = productId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _profile = profile;
  }

  ReviewModel.fromJson(dynamic json) {
    _id = json['id'];
    _description = json['description'];
    _rating = json['rating'];
    _customerId = json['customer_id'];
    _productId = json['product_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _profile =
        json['profile'] != null ? Profile.fromJson(json['profile']) : null;
  }

  num? _id;
  String? _description;
  String? _rating;
  num? _customerId;
  num? _productId;
  String? _createdAt;
  String? _updatedAt;
  Profile? _profile;

  ReviewModel copyWith({
    num? id,
    String? description,
    String? rating,
    num? customerId,
    num? productId,
    String? createdAt,
    String? updatedAt,
    Profile? profile,
  }) =>
      ReviewModel(
        id: id ?? _id,
        description: description ?? _description,
        rating: rating ?? _rating,
        customerId: customerId ?? _customerId,
        productId: productId ?? _productId,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        profile: profile ?? _profile,
      );

  num? get id => _id;

  String? get description => _description;

  String? get rating => _rating;

  num? get customerId => _customerId;

  num? get productId => _productId;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Profile? get profile => _profile;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['description'] = _description;
    map['rating'] = _rating;
    map['customer_id'] = _customerId;
    map['product_id'] = _productId;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_profile != null) {
      map['profile'] = _profile?.toJson();
    }
    return map;
  }
}
