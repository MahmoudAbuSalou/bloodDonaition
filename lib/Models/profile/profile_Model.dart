class ProfileModel {
  ProfileModel({
    required this.message,
    required this.status,
    required this.user,
    required this.userprofile,
  });
  late final  message;
  late final  status;
  late final User user;
  late final Userprofile userprofile;

  ProfileModel.fromJson(Map<String, dynamic> json){
    message = json['message'];
    status = json['status'];
    user = User.fromJson(json['user']);
    userprofile = Userprofile.fromJson(json['userprofile']);
  }


}

class User {
  User({
    required this.name,
    required this.email,
    required this.isAdmin,
    required this.address,
    required this.phone,
  });
  late final  name;
  late final  email;
  late final  isAdmin;
  late final  address;
  late final  phone;

  User.fromJson(Map<String, dynamic> json){
    name = json['name'];
    email = json['email'];
    isAdmin = json['isAdmin'];
    address = json['address'];
    phone = json['phone'];
  }


}

class Userprofile {
  Userprofile({
    required this.weight,
    required this.gender,
    required this.bloodType,
    required this.donationCount,
    required this.dateOfLastDonation,
  });
  late final  weight;
  late final  gender;
  late final  bloodType;
  late final  donationCount;
  late final  dateOfLastDonation;

  Userprofile.fromJson(Map<String, dynamic> json){
    weight = json['weight'];
    gender = json['gender'];
    bloodType = json['blood_type'];
    donationCount = json['donation_count'];
    dateOfLastDonation = json['dateOfLastDonation'];
  }


}