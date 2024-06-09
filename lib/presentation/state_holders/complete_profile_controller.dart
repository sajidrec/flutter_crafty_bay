import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/data/network_caller/network_caller.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';

class CompleteProfileController extends GetxController {
  Future<bool> isProfileCompleted() async {
    NetworkResponse readProfile = await NetworkCaller.getRequest(
      url: Urls.readProfileUrl,
    );

    if (readProfile.responseData["data"] != null) {
      return true;
    }
    return false;
  }
}
