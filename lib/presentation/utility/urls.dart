class Urls{
  static const String baseUrl = "https://craftybay.teamrabbil.com/api";
  static String sendOTPtoEmail(String email) => "$baseUrl/UserLogin/$email";
  static String verifyEmail(String email, String otp) => "$baseUrl/VerifyLogin/$email/$otp";
  static String homeSlider = "$baseUrl/ListProductSlider";
}