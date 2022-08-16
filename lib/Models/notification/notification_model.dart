class NotificationModel {
  NotificationModel({
    required this.to,
    required this.notification,
  });
  late final String to;
  late final Notification notification;

  NotificationModel.fromJson(Map<String, dynamic> json){
    to = json['to'];
    notification = Notification.fromJson(json['notification']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['to'] = to;
    _data['notification'] = notification.toJson();
    return _data;
  }
}

class Notification {
  Notification({
    required this.title,
    required this.body,
  });
  late final String title;
  late final String body;

  Notification.fromJson(Map<String, dynamic> json){
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['title'] = title;
    _data['body'] = body;
    return _data;
  }
}