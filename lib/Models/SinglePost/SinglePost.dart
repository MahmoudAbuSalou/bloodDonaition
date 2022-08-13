class SinglePost {
  String? status;
  String? message;
  SinglePostData? data;

  SinglePost({this.status, this.message, this.data});

  SinglePost.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new SinglePostData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class SinglePostData {
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

  SinglePostData(
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
        this.userId});

  SinglePostData.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}
