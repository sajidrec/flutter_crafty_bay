
import 'package:crafty_bay/data/models/create_review_model.dart';
import 'package:crafty_bay/data/network_caller/network_caller.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';

class CreateReviewScreenController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  Future<void> submitReview({
    required String reviewDescription,
    required int productId,
  }) async {
    _inProgress = true;
    update();

    final data = CreateReviewModel(
      productId: productId.toString(),
      description: reviewDescription.toString(),
      rating: 5.toString(),
    ).toJson();

    await NetworkCaller.postRequest(
      url: Urls.createReviewUrl,
      body: data,
    );

    _inProgress = false;
    update();
  }
}
