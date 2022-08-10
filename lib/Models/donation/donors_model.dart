class DonorsModel {
  String? status;
  String? message;
  List<DataMode>? data;

  DonorsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DataMode>[];
      json['data'].forEach((element) {
        data!.add(new DataMode.fromJson(element));
      });
    }
  }
}

class DataMode {
  int? donateId;
  int? postId;
  int? userId;
  int? acceptanceRate;
  bool? statusRequest;
  String? createdAt;
  String? updatedAt;
  User? user;

  DataMode.fromJson(Map<String, dynamic> json) {
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
