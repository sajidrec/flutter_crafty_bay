import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/data/network_caller/network_caller.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';

class WishListIconController extends GetxController {
  List<int> _favItemList = [];
  bool _inProgress = false;

  get inProgress => _inProgress;

  Future<List<int>> requestWishList() async {
    _inProgress = true;
    update();

    _favItemList = [];

    NetworkResponse response = await NetworkCaller.getRequest(
      url: Urls.getWishList,
    );

    for (int i = 0; i < await response.responseData["data"].length; i++) {
      _favItemList.add(await response.responseData["data"][i]["product_id"]);
    }

    _inProgress = false;
    update();

    return _favItemList;
  }
}
