class BloodRequest {
  BloodRequest({
    required this.firstName,
    required this.lastName,
    required this.bloodBags,
    required this.cityName,
    required this.hospitalName,
    required this.gender,
    required this.postType,
    required this.bloodType,
    required this.bloodOwner,
    required this.phone,
    required this.expiryDate,
  });
   String? firstName;
   String? lastName;
   String? bloodBags;
   String? cityName;
   String? hospitalName;
   String? gender;
   bool ?postType;
   String? bloodType;
   String ?bloodOwner;
   String ?phone;
   String? expiryDate;


  BloodRequest.fromJson(Map<String, dynamic> json){
    firstName = json['firstName'];
    lastName = json['lastName'];
    bloodBags = json['bloodBags'];
    cityName = json['cityName'];
    hospitalName = json['hospitalName'];
    gender = json['gender'];
    postType = json['postType'];
    bloodType = json['bloodType'];
    bloodOwner = json['bloodOwner'];
    phone = json['phone'];
    expiryDate = json['expiryDate'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['firstName'] = firstName;
    _data['lastName'] = lastName;
    _data['bloodBags'] = bloodBags;
    _data['cityName'] = cityName;
    _data['hospitalName'] = hospitalName;
    _data['gender'] = gender;
    _data['postType'] = postType;
    _data['bloodType'] = bloodType;
    _data['bloodOwner'] = bloodOwner;
    _data['phone'] = phone;
    _data['expiryDate'] = expiryDate;
    return _data;
  }
}