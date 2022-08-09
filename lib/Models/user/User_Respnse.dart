class UserResponse {
  UserResponse({
    required this.status,
    required this.message,
    required this.user,
    required this.userprofile,
    required this.token,
  });
  late final  status;
  late final  message;
  User? user;
  Userprofile ? userprofile;
  var   token;

  UserResponse.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    if(json['user']!=null)
      user = User.fromJson(json['user']);
    if(json['userprofile']!=null)
      userprofile = Userprofile.fromJson(json['userprofile']);
    if(json['token']!=null)
      token = json['token'];
  }


}

class User {
  User({
    required this.userId,
    required this.phone,
    required this.address,
    required this.name,
    required this.email,
    required this.isAdmin,
    required this.birthDate,
  });
  late final  userId;
  late final  phone;
  late final  address;
  late final  name;
  late final  email;
  late final  isAdmin;
  late final  birthDate;

  User.fromJson(Map<String, dynamic> json){
    userId = json['user_id'];
    phone = json['phone'];
    address = json['address'];
    name = json['name'];
    email = json['email'];
    isAdmin = json['isAdmin'];
    birthDate = json['birthDate'];
    print(this.phone);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user_id'] = userId;
    _data['phone'] = phone;
    _data['address'] = address;
    _data['name'] = name;
    _data['email'] = email;
    _data['isAdmin'] = isAdmin;
    _data['birthDate'] = birthDate;
    return _data;
  }
}

class Userprofile {
  Userprofile({
    required this.weight,
    required this.gender,
    required this.bloodType,
  });
  late final  weight;
  late final  gender;
  late final  bloodType;

  Userprofile.fromJson(Map<String, dynamic> json){
    weight = json['weight'];
    gender = json['gender'];
    bloodType = json['blood_type'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['weight'] = weight;
    _data['gender'] = gender;
    _data['blood_type'] = bloodType;
    return _data;
  }
}