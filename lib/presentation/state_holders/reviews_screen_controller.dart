
import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/data/models/review_model.dart';
import 'package:crafty_bay/data/network_caller/network_caller.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';

class ReviewsScreenController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  Future<List<ReviewModel>> requestReviewList({
    required int productId,
  }) async {
    _inProgress = true;
    update();

    List<ReviewModel> reviewList = [];

    final NetworkResponse response = await NetworkCaller.getRequest(
      url: Urls.getReviewList(
        productId,
      ),
    );

    for (int i = 0; i < (response.responseData["data"]?.length ?? 0); i++) {
      reviewList.insert(
        0,
        ReviewModel.fromJson(
          response.responseData["data"][i],
        ),
      );
    }

    _inProgress = false;
    update();
    
    return reviewList;
  }
}
