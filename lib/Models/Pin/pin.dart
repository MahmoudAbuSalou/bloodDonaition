class Pin {
  Pin({
    required this.status,
    required this.message,
    required this.pin,
  });
  late final String status;
  late final String message;
  late final String pin;

  Pin.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    pin = json['pin'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['pin'] = pin;
    return _data;
  }
}