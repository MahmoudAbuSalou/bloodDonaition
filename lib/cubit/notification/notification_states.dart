abstract class NotificationStates{}

class SendNotificationLoadingState extends NotificationStates{}

class SendNotificationSuccessState extends NotificationStates{}

class SendNotificationErrorState extends NotificationStates{
  final String error;
  SendNotificationErrorState(this.error);

}
class GetTokenPhoneLoadingState extends NotificationStates{}

class GetTokenPhoneSuccessState extends NotificationStates{}

class GetTokenPhoneErrorState extends NotificationStates{
  final String error;
  GetTokenPhoneErrorState(this.error);

}