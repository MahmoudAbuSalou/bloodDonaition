class TokenPhone {
  TokenPhone({
    required this.message,
    required this.status,
    required this.tokenPh,
  });
  late final String message;
  late final String status;
  late final String tokenPh;

  TokenPhone.fromJson(Map<String, dynamic> json){
    message = json['message'];
    status = json['status'];
    tokenPh = json['tokenPh'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['status'] = status;
    _data['tokenPh'] = tokenPh;
    return _data;
  }
}