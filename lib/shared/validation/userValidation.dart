class UserInputValidation{
  static Pattern pattern = r'^[a-zA-Z0-9.!#$%&*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$';
  static Pattern phonePattern = r'^[0-9]+$';
  static Pattern date = r'^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$';

  static String ValidateName ({required String value}) {
    if (value==null || value.isEmpty) {
      return " user name can't empty";
    }
    if (value.contains(" ")) {
      return "user name can't contain space";
    }
    if (value.length < 2) {
      return "user name can't be\nless than two characters ";
    }
    if (value.length > 15) {
      return "user name can't be\nmore than 15 characters ";
    }
    return "";
  }


  static String ValidatePassword({required String value}) {
    if (value.isEmpty) {
      return " password can't empty";
    }
    if (value.contains(" ")) {
      return "password can't contain space";
    }
    if (value.length < 6) {
      return "password can't be\nless than 5 characters ";
    }
    if (value.length > 20) {
      return "password can't be\nmore than 20 characters ";
    }
    return "";
  }

  // ignore: missing_return
  static String ValidateEmail({required String value}) {
    if (value.isEmpty) {
      return " Email can't empty";
    }
    if (value.contains(" ")) {
      return "Email can't contain space";
    }
    if (value.length < 10) {
      return "Email can't be\nless than 10 characters ";
    }
    if (value.length > 30) {
      return "Email can't be\nmore than 30 characters ";
    }
    RegExp regex = RegExp(pattern.toString());
    if (!regex.hasMatch(value)) {
      return "Email address is invalid ";
    }
    return "";
  }

  // ignore: missing_return
  static String ValidatePhone({required String value}) {
    if (value.isEmpty) {
      return " Phone can't empty";
    }
    if (value.contains(" ")) {
      return "Phone can't contain space";
    }
    if (value.length < 10) {
      return "Phone can't be\nless than 10 characters ";
    }
    if (value.length > 20) {
      return "Phone can't be\nmore than 30 characters ";
    }
    RegExp regex = RegExp(phonePattern.toString());
    if (!regex.hasMatch(value)) {
      return "Phone Number is invalid ";
    }
    return "";
  }
  static String ValidateDate({required String value}) {
    if (value.isEmpty) {
      return " Date can't empty";
    }
    if (value.contains(" ")) {
      return "Date can't contain space";
    }

    RegExp regex = RegExp(date.toString());
    if (!regex.hasMatch(value)) {
      return "Date is invalid ";
    }
    return "";
  }







}