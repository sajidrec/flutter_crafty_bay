import 'package:crafty_bay/presentation/state_holders/add_to_cart_controller.dart';
import 'package:crafty_bay/presentation/state_holders/wish_list_controller.dart';
import 'package:crafty_bay/presentation/state_holders/cart_list_controller.dart';
import 'package:crafty_bay/presentation/state_holders/category_list_controller.dart';
import 'package:crafty_bay/presentation/state_holders/complete_profile_controller.dart';
import 'package:crafty_bay/presentation/state_holders/create_review_screen_controller.dart';
import 'package:crafty_bay/presentation/state_holders/home_slider_controller.dart';
import 'package:crafty_bay/presentation/state_holders/main_bottom_nav_bar_controller.dart';
import 'package:crafty_bay/presentation/state_holders/new_product_list_controller.dart';
import 'package:crafty_bay/presentation/state_holders/otp_resend_controller.dart';
import 'package:crafty_bay/presentation/state_holders/popular_product_list_controller.dart';
import 'package:crafty_bay/presentation/state_holders/product_details_controller.dart';
import 'package:crafty_bay/presentation/state_holders/product_list_by_category_controller.dart';
import 'package:crafty_bay/presentation/state_holders/special_product_list_controller.dart';
import 'package:crafty_bay/presentation/state_holders/verify_email_controller.dart';
import 'package:crafty_bay/presentation/state_holders/verify_otp_controller.dart';
import 'package:crafty_bay/presentation/state_holders/wish_list_icon_controller.dart';
import 'package:get/get.dart';

import 'presentation/state_holders/reviews_screen_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(MainBottomNavBarController());
    Get.put(HomeSliderController());
    Get.put(CategoryListController());
    Get.put(ProductListByCategoryController());
    Get.put(PopularProductListController());
    Get.put(NewProductListController());
    Get.put(SpecialProductListController());
    Get.put(ProductDetailsController());
    Get.put(AddToCartController());
    Get.put(VerifyEmailController());
    Get.put(VerifyOtpController());
    Get.put(WishListController());
    Get.put(WishListController());
    Get.put(CartListController());

    //
    Get.put(OtpResendController());
    Get.put(CompleteProfileController());
    Get.put(ReviewsScreenController());
    Get.put(CreateReviewScreenController());
    Get.put(WishListIconController());
  }
}
