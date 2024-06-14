import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/data/models/wish_list_item.dart';
import 'package:crafty_bay/data/models/wish_list_model.dart';
import 'package:crafty_bay/data/network_caller/network_caller.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';

class WishListController extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';
  List<WishListItem> _wishList = [];
  bool _isInTheWishList = false;

  bool get isInTheWishList => _isInTheWishList;

  List<WishListItem> get wishList => _wishList;

  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage;

  Future<bool> getWishList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(
      url: Urls.getWishList,
    );
    if (response.isSuccess) {
      _wishList = WishListModel.fromJson(response.responseData).wishList ?? [];
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }

  Future<void> checkIfInTheWishList({required int productId}) async {
    try {
      NetworkResponse response =
          await NetworkCaller.getRequest(url: Urls.getWishList);
      if (response.isSuccess) {
        for (int i = 0; i < (response.responseData["data"].length ?? 0); i++) {
          if (int.tryParse(response.responseData["data"][i]["product_id"]) ==
              productId) {
            _isInTheWishList = true;
            update();
            return;
          }
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> addToWishList(int productId) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(
      url: Urls.createWishList(productId),
    );
    if (response.isSuccess) {
      isSuccess = true;
      _isInTheWishList = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }

  Future<void> removeFromWishList(int productId) async {
    _inProgress = true;
    update();
    try {
      final NetworkResponse response = await NetworkCaller.getRequest(
        url: Urls.removeFromWishListUrl(
          productId: productId,
        ),
      );
      if (response.isSuccess) {
        _isInTheWishList = false;
      }
    } catch (e) {
      rethrow;
    }

    _inProgress = false;
    update();
  }
}
