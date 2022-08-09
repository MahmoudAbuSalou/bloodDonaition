class UserModel {
  UserModel({
    required this.name,
    required this.phone,
    required this.password,
    required this.email,
    required this.address,
    required this.gender,
    required this.weight,
    required this.bloodType,
    required this.isAdmin,
    required this.birthDate,
    required this.token,
  });
  late final String name;
  late final int phone;
  late final String password;
  late final String email;
  late final String address;
  late final String gender;
  late final String weight;
  late final String bloodType;
  late final bool isAdmin;
  late final String birthDate;
  late final String token;
  UserModel.fromJson(Map<String, dynamic> json){
    name = json['name'];
    phone = json['phone'];
    password = json['password'];
    email = json['email'];
    address = json['address'];
    gender = json['gender'];
    weight = json['weight'];
    bloodType = json['blood_type'];
    isAdmin = json['isAdmin'];
    birthDate = json['birthDate'];
    token = json['tokenPh'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['phone'] = phone;
    _data['password'] = password;
    _data['email'] = email;
    _data['address'] = address;
    _data['gender'] = gender;
    _data['weight'] = weight;
    _data['blood_type'] = bloodType;
    _data['isAdmin'] = isAdmin;
    _data['birthDate'] = birthDate;
    _data['tokenPh'] = token;
    return _data;
  }
}