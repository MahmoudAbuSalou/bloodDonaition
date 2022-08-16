class DonorsModel {
  String? status;
  String? message;
  List<DataModel>? data;

  DonorsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DataModel>[];
      json['data'].forEach((element) {
        data!.add(new DataModel.fromJson(element));
      });
    }
  }
}

class DataModel {
  int? donateId;
  int? postId;
  int? userId;
  int? acceptanceRate;
  bool? statusRequest;
  String? createdAt;
  String? updatedAt;
  User? user;

  DataModel.fromJson(Map<String, dynamic> json) {
    donateId = json['donate_id'];
    postId = json['post_id'];
    userId = json['user_id'];
    acceptanceRate = json['acceptance_rate'];
    statusRequest = json['statusRequest'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
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
  String? tokenPh;
  String? birthDate;
  String? createdAt;
  String? updatedAt;

  User.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    address = json['address'];
    isAdmin = json['isAdmin'];
    tokenPh = json['tokenPh'];
    birthDate = json['birthDate'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
}
