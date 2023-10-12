class Urls{
  static const String baseUrl = "https://craftybay.teamrabbil.com/api";
  static String sendOTPtoEmail(String email) => "$baseUrl/UserLogin/$email";
  static String productsByRemarks(String remarks) => "$baseUrl/ListProductByRemark/$remarks";
  static String getProductsByCategory(int id) => "$baseUrl/ListProductByCategory/$id";
  static String verifyEmail(String email, String otp) => "$baseUrl/VerifyLogin/$email/$otp";
  static String homeSlider = "$baseUrl/ListProductSlider";
  static String categoryList = "$baseUrl/CategoryList";
  static const String addToCart = "$baseUrl/CreateCartList";
  static const String getCartList = "$baseUrl/CartList";
  static String getProductDetails(int id) => "$baseUrl/ProductDetailsById/$id";
}