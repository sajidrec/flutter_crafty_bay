class CreateReviewModel {
  CreateReviewModel({
    required String description,
    required String productId,
    required String rating,
  }) {
    _description = description;
    _productId = productId;
    _rating = rating;
  }

  CreateReviewModel.fromJson(dynamic json) {
    _description = json['description'];
    _productId = json['product_id'];
    _rating = json['rating'];
  }

  String? _description;
  String? _productId;
  String? _rating;

  CreateReviewModel copyWith({
    required String description,
    required String productId,
    required String rating,
  }) =>
      CreateReviewModel(
        description: description,
        productId: productId,
        rating: rating,
      );

  String? get description => _description;

  String? get productId => _productId;

  String? get rating => _rating;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['description'] = _description;
    map['product_id'] = _productId;
    map['rating'] = _rating;
    return map;
  }
}
