import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/data/models/user_info_model.dart';
import 'package:crafty_bay/data/network_caller/network_caller.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';

class CompleteProfileController extends GetxController {
  Future<UserInfoModel> getUserData() async {
    try {
      NetworkResponse response = await NetworkCaller.getRequest(
        url: Urls.readProfileUrl,
      );
      return UserInfoModel.fromJson(response.responseData["data"]);
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> isProfileCompleted() async {
    NetworkResponse readProfile = await NetworkCaller.getRequest(
      url: Urls.readProfileUrl,
    );
    if ((readProfile.responseCode ?? 0) >= 400 &&
        (readProfile.responseCode ?? 0) <= 499) {
      return false;
    }
    if (await readProfile.responseData["data"] != null) {
      return true;
    }
    return false;
  }
}
