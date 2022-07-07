class Urls {
  static const String baseUrl = "http://192.168.183.177:3000/api/";

  static const String singupUrl =  baseUrl+"users/signUp";
  static const String genPinUrl =  baseUrl+"genPin/";
  static const String deleteUserUrl =  baseUrl+"users/deleteUser";
  static const String loginUrl =  baseUrl+"users/login";
  static const String changePasswordUrl =  baseUrl+"users/chgPassword";
  static const String checkAccountUrl =  baseUrl+"users/checkEmail";
  static const String AddRequestBlood =  baseUrl+"home/addRequest";
  static const String getPOST=  baseUrl+"/home/getAll/";
  static const String getSinglePOST=  baseUrl+"home/getSinglePost/";
  static const String deleteSinglePOST=  baseUrl+"home/deletePost/";
  static const String upDateSinglePOST=  baseUrl+"home/updatePost/";

}