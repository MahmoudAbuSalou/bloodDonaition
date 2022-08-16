class AcceptanceRateModel {
  String? status;
  String? message;
  AcceptanceRateData? data;

  AcceptanceRateModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new AcceptanceRateData.fromJson(json['data']) : null;
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

class AcceptanceRateData {
  int? donateId;
  int? acceptanceRate;
  int? postId;
  int? userId;
  bool? statusRequest;
  String? updatedAt;
  String? createdAt;

  AcceptanceRateData.fromJson(Map<String, dynamic> json) {
    donateId = json['donate_id'];
    acceptanceRate = json['acceptance_rate'];
    postId = json['post_id'];
    userId = json['user_id'];
    statusRequest = json['statusRequest'];
    updatedAt = json['updatedAt'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['donate_id'] = this.donateId;
    data['acceptance_rate'] = this.acceptanceRate;
    data['post_id'] = this.postId;
    data['user_id'] = this.userId;
    data['statusRequest'] = this.statusRequest;
    data['updatedAt'] = this.updatedAt;
    data['createdAt'] = this.createdAt;
    return data;
  }
}
