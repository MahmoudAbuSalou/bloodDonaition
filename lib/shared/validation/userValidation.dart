class UserInputValidation{
  static Pattern pattern = r'^[a-zA-Z0-9.!#$%&*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$';
  static Pattern phonePattern = r'^[0-9]+$';
  static Pattern date = r'^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$';

  static String ValidateName ({required String value}) {
    if (value==null || value.isEmpty) {
      return " هذا الحقل لا يمكن أن يكون فارغاً";
    }
    if (value.contains(" ")) {
      return "هذا الحقل لا يمكن أن يحتوي فراغات";
    }
    if (value.length < 2) {
      return "هذا الحقل لا يمكن أن يكون أقل من محرفين";
    }
    if (value.length > 15) {
      return "هذا الحقل لا يمكن أن يكون أكثر من 15 محرف";
    }
    return "";
  }


  static String ValidatePassword({required String value}) {
    if (value.isEmpty|| value == null) {
      return "هذا الحقل لا يمكن أن يكون فارغا";
    }
    if (value.contains(" ")) {
      return "هذا الحقل لا يمكن أن يحتوي فراغات";
    }
    if (value.length < 6) {
      return "هذا الحقل لا يمكن أن يكون أقل من 6 محارف";
    }
    if (value.length > 20) {
      return "هذا الحقل لا يمكن أن يكون أكثر من 20 محرف";
    }
    return "";
  }

  // ignore: missing_return
  static String ValidateEmail({required String value}) {
    if (value.isEmpty || value == null) {
      return "هذا الحقل لا يمكن أن يكون فارغا";
    }
    if (value.contains(" ")) {
      return "هذا الحقل لا يمكن أن يحتوي فراغات";
    }
    if (value.length < 10) {
      return "هذا الحقل لا يمكن أن يكون أقل من 10 محارف";
    }
    if (value.length > 30) {
      return "هذا الحقل لا يمكن أن يكون أكثر من 30 محرف";
    }
    RegExp regex = RegExp(pattern.toString());
    if (!regex.hasMatch(value)) {
      return "المدخلات لا تطابق بريد إلكتروني";
    }
    return "";
  }

  // ignore: missing_return
  static String ValidatePhone({required String value}) {
    if (value.isEmpty || value == null) {
      return "هذا الحقل لا يمكن أن يكون فارغا";
    }
    if (value.contains(" ")) {
      return "هذا الحقل لا يمكن أن يحتوي فراغات";
    }
    if (value.length < 10) {
      return "هذا الحقل لا يمكن أن يكون أقل من 10 محارف";
    }
    if (value.length > 20) {
      return "هذا الحقل لا يمكن أن يكون أكثر من 20 محرف";
    }
    RegExp regex = RegExp(phonePattern.toString());
    if (!regex.hasMatch(value)) {
      return "المدخلات لا تطابق رقم هاتف";;
    }
    return "";
  }
  static String ValidateDate({required String value}) {
    if (value.isEmpty || value == null) {
      return "هذا الحقل لا يمكن أن يكون فارغا";
    }
    if (value.contains(" ")) {
      return "هذا الحقل لا يمكن أن يحتوي فراغات";
    }

    RegExp regex = RegExp(date.toString());
    if (!regex.hasMatch(value)) {
      return "المدخلات لا تطابق تاريخ";;
    }
    return "";
  }







}