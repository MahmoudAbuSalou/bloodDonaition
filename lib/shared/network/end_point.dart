class Urls {
  // static const String baseUrl = "http://10.0.2.2:3000/api/";
  static const String baseUrl = "http://192.168.29.97:3000/api/";
  static const String singupUrl = baseUrl + "users/signUp";
  static const String genPinUrl = baseUrl + "genPin/";
  static const String deleteUserUrl = baseUrl + "users/deleteUser";
  static const String logOutUserUrl = baseUrl + "users/logout";
  static const String loginUrl = baseUrl + "users/login";
  static const String changePasswordUrl = baseUrl + "users/chgPassword";
  static const String checkAccountUrl = baseUrl + "users/checkEmail";
  static const String AddRequestBlood = baseUrl + "home/addRequest";
  static const String getPOST = baseUrl + "home/getAll/";
  static const String getSinglePOST = baseUrl + "home/getSinglePost/";
  static const String deleteSinglePOST = baseUrl + "home/deletePost/";
  static const String upDateSinglePOST = baseUrl + "home/updatePost/";
  static const String updateProfile = baseUrl + "users/updateProfile";
  static const String getProfile = baseUrl + "users/";

  // Added by Muhammad Al-Rifai.
  static const String acceptanceRate = baseUrl + "Donation/acceptance_rate";
  static const String userPosts = baseUrl + "Donation/user_posts";
  static const String getDonors = baseUrl + "Donation/getDonors/";
  static const String deleteDonor = baseUrl + "Donation/delete/";
  static const String confirmDonor = baseUrl + "Donation/confirm/";
  static const String search = baseUrl + "search";
  static const String updatePost = baseUrl + "home/updatePost/";
// ==*=*=====*======*

  static const String tokenPh = baseUrl + "users/getTokenPhone/";
  static const String notification = "https://fcm.googleapis.com/fcm/send";

}