class Post {
  String? status;
  String? message;
  List<Data>? data;

  Post({this.status, this.message, this.data});

  Post.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? postId;
  String? firstName;
  String? lastName;
  int? bloodBags;
  int? bloodBagsCollect;
  String? cityName;
  String? hospitalName;
  String? gender;
  bool? postType;
  String? bloodType;
  String? bloodOwner;
  int? phone;
  String? expiryDate;
  String? createdAt;
  String? updatedAt;
  int? userId;
  User? user;

  Data(
      {this.postId,
      this.firstName,
      this.lastName,
      this.bloodBags,
      this.bloodBagsCollect,
      this.cityName,
      this.hospitalName,
      this.gender,
      this.postType,
      this.bloodType,
      this.bloodOwner,
      this.phone,
      this.expiryDate,
      this.createdAt,
      this.updatedAt,
      this.userId,
      this.user});

  Data.fromJson(Map<String, dynamic> json) {
    postId = json['post_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    bloodBags = json['bloodBags'];
    bloodBagsCollect = json['bloodBagsCollect'];
    cityName = json['cityName'];
    hospitalName = json['hospitalName'];
    gender = json['gender'];
    postType = json['postType'];
    bloodType = json['bloodType'];
    bloodOwner = json['bloodOwner'];
    phone = json['phone'];
    expiryDate = json['expiryDate'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    userId = json['user_id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['post_id'] = this.postId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['bloodBags'] = this.bloodBags;
    data['bloodBagsCollect'] = this.bloodBagsCollect;
    data['cityName'] = this.cityName;
    data['hospitalName'] = this.hospitalName;
    data['gender'] = this.gender;
    data['postType'] = this.postType;
    data['bloodType'] = this.bloodType;
    data['bloodOwner'] = this.bloodOwner;
    data['phone'] = this.phone;
    data['expiryDate'] = this.expiryDate;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['user_id'] = this.userId;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? userId;
  String? name;
  String? email;
  String? password;
  int? phone;
  String? address;
  bool? isAdmin;
  String? birthDate;
  String? createdAt;
  String? updatedAt;

  User(
      {this.userId,
      this.name,
      this.email,
      this.password,
      this.phone,
      this.address,
      this.isAdmin,
      this.birthDate,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    address = json['address'];
    isAdmin = json['isAdmin'];
    birthDate = json['birthDate'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['isAdmin'] = this.isAdmin;
    data['birthDate'] = this.birthDate;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
