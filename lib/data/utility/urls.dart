class Urls {
  static const String _baseUrl = 'http://ecom-api.teamrabbil.com/api';

  static const String homeSlider = '$_baseUrl/ListProductSlider';
  static const String categoryList = '$_baseUrl/CategoryList';

  static String productListByCategory(int categoryId) =>
      '$_baseUrl/ListProductByCategory/$categoryId';

  static String productListByRemark(String remark) =>
      '$_baseUrl/ListProductByRemark/$remark';

  static String productDetails(int productId) =>
      '$_baseUrl/ProductDetailsById/$productId';

  static const String addToCart = '$_baseUrl/CreateCartList';

  static String verifyEmail(String email) => '$_baseUrl/UserLogin/$email';

  static String verifyOtp(String email, String otp) =>
      '$_baseUrl/VerifyLogin/$email/$otp';

  static String createWishList(int productId) =>
      '$_baseUrl/CreateWishList/$productId';

  static String getReviewList(int productId) =>
      '$_baseUrl/ListReviewByProduct/$productId';

  static String deleteCartUrl(int productId) =>
      '$_baseUrl/DeleteCartList/$productId';

  static const String getWishList = '$_baseUrl/ProductWishList';
  static const String getCartList = '$_baseUrl/CartList';

  static const String readProfileUrl = '$_baseUrl/ReadProfile';

  static const String createProfileUrl = '$_baseUrl/CreateProfile';

  static const String createReviewUrl = '$_baseUrl/CreateProductReview';

  static const String getProductWishListUrl = '$_baseUrl/ProductWishList';

  static String removeFromWishListUrl({required int productId}) {
    return "$_baseUrl/RemoveWishList/$productId";
  }
}
