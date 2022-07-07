class UpdateSinglePost {
  String? firstName;
  String? lastName;
  String? bloodBags;
  String? cityName;
  String? hospitalName;
  String? gender;
  bool? postType;
  String? phone;
  String? expiryDate;

  UpdateSinglePost(
      {this.firstName,
        this.lastName,
        this.bloodBags,
        this.cityName,
        this.hospitalName,
        this.gender,
        this.postType,
        this.phone,
        this.expiryDate});

  UpdateSinglePost.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    bloodBags = json['bloodBags'];
    cityName = json['cityName'];
    hospitalName = json['hospitalName'];
    gender = json['gender'];
    postType = json['postType'];
    phone = json['phone'];
    expiryDate = json['expiryDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['bloodBags'] = this.bloodBags;
    data['cityName'] = this.cityName;
    data['hospitalName'] = this.hospitalName;
    data['gender'] = this.gender;
    data['postType'] = this.postType;
    data['phone'] = this.phone;
    data['expiryDate'] = this.expiryDate;
    return data;
  }
}
