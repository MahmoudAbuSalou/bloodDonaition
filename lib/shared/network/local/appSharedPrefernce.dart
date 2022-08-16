import 'cachehelper.dart';

class AppSharedPreferences {
  //token
 static String Token='token';
  static String get getToken => CacheHelper.getData(key: Token) ?? '';
  static saveToken(String value) => CacheHelper.saveData(key: Token, value: value);
  static bool get hasToken => CacheHelper.contains(Token);
  static dynamic get removeToken => CacheHelper.removeData(key: Token);

 static String TokenPh='tokenPhone';
 static String get getTokenPh => CacheHelper.getData(key: TokenPh) ?? '';
 static saveTokenPh(String value) => CacheHelper.saveData(key: TokenPh, value: value);
 static bool get hasTokenPh => CacheHelper.contains(TokenPh);
 static dynamic get removeTokenPh => CacheHelper.removeData(key: TokenPh);
  //name
 static String Name='name';
 static String get getName => CacheHelper.getData(key: Name) ?? '';
 static saveName(String value) => CacheHelper.saveData(key: Name, value: value);
 static bool get hasName => CacheHelper.contains(Name);
 static dynamic get removeName => CacheHelper.removeData(key: Name);

 //email
 static String Email='email';
 static String get getEmail => CacheHelper.getData(key: Email) ?? '';
 static saveEmail(String value) => CacheHelper.saveData(key: Email, value: value);
 static bool get hasEmail => CacheHelper.contains(Email);
 static dynamic get removeEmail => CacheHelper.removeData(key: Email);

 //phone
 static String Phone='phone';
 static String get getPhone => CacheHelper.getData(key: Phone) ?? '';
 static savePhone(String value) => CacheHelper.saveData(key: Phone, value: value);
 static bool get hasPhone => CacheHelper.contains(Phone);
 static dynamic get removePhone => CacheHelper.removeData(key: Phone);

 //weight
 static String Weight='weight';
 static String get getWeight => CacheHelper.getData(key: Weight) ?? '';
 static saveWeight(String value) => CacheHelper.saveData(key: Weight, value: value);
 static bool get hasWeight => CacheHelper.contains(Weight);
 static dynamic get removeWeight => CacheHelper.removeData(key: Weight);

 //blood_type
 static String BloodType='bloodType';
 static String get getBlood_type => CacheHelper.getData(key: BloodType) ?? '';
 static saveBlood_type(String value) => CacheHelper.saveData(key: BloodType, value: value);
 static bool get hasBlood_type => CacheHelper.contains(BloodType);
 static dynamic get removeBlood_type => CacheHelper.removeData(key: BloodType);

 //gender
 static String Gender='gender';
 static String get getGender => CacheHelper.getData(key: Gender) ?? '';
 static saveGender(String value) => CacheHelper.saveData(key: Gender, value: value);
 static bool get hasGender => CacheHelper.contains(Gender);
 static dynamic get removeGender => CacheHelper.removeData(key: Gender);
 //birthDate
 static String BirthDate='date';
 static String get getBirthDate => CacheHelper.getData(key: BirthDate) ?? '';
 static saveBirthDate(String value) => CacheHelper.saveData(key: BirthDate, value: value);
 static bool get hasBirthDate => CacheHelper.contains(BirthDate);
 static dynamic get removeBirthDate => CacheHelper.removeData(key: BirthDate);
//address
 static String Address='address';
 static String get getAddress => CacheHelper.getData(key: Address) ?? '';
 static saveAddress(String value) => CacheHelper.saveData(key: Address, value: value);
 static bool get hasAddress => CacheHelper.contains(Address);
 static dynamic get removeAddress => CacheHelper.removeData(key: Address);

 // //PostId
 // static String post_id='post_id';
 // static String get getPostId => CacheHelper.getData(key: post_id) ?? '';
 // static savePostId(String value) => CacheHelper.saveData(key: post_id, value: value);
 // static bool get hasPostId => CacheHelper.contains(post_id);
 // static dynamic get removePostId => CacheHelper.removeData(key: post_id);

 //UserId
 static String user_id='user_id';
 static  get getUserId => CacheHelper.getData(key: user_id);
 static saveUserId( value) => CacheHelper.saveData(key: user_id, value: value);
 static bool get hasUserId => CacheHelper.contains(user_id);
 static dynamic get removeUserId => CacheHelper.removeData(key: user_id);


}
