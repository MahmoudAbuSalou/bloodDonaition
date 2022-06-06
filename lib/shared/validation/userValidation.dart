class UserInputValidation{
  static Pattern pattern = r'^[a-zA-Z0-9.!#$%&*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$';
  static Pattern phonePattern = r'^[0-9]+$';
  static Pattern date = r'^\d{4}\-(0?[1-9]|1[012])\-(0?[1-9]|[12][0-9]|3[01])$';

  static  ValidateName ({ String ?value}) {
    if (value!.isEmpty) {
      return "هذا الحقل لا يمكن أن يكون فارغا";
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

  }


  static ValidatePassword({ String ?value}) {
    if (value!.isEmpty) {
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

  }

  // ignore: missing_return
  static  ValidateEmail({ String ?value}) {
    if (value!.isEmpty) {
      return "هذا الحقل لا يمكن أن يكون فارغا";
    }
    if (!value.endsWith('gmail.com')) {
      return "هذا الحقل يجب ان ينتهي ب gmail.com";
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

  }

  // ignore: missing_return
  static  ValidatePhone({ String ?value}) {
    if (value!.isEmpty) {
      return "هذا الحقل لا يمكن أن يكون فارغا";
    }
    if (!value.startsWith('09')) {
      return "هذا الحقل يجب ان يبدا ب 09";
    }
    if (value.contains(" ")) {
      return "هذا الحقل لا يمكن أن يحتوي فراغات";
    }
    if (value.length < 10) {
      return "هذا الحقل لا يمكن أن يكون أقل من 10 محارف";
    }
    if (value.length > 10) {
      return "هذا الحقل لا يمكن أن يكون أكثر من 10 محرف";
    }
    RegExp regex = RegExp(phonePattern.toString());
    if (!regex.hasMatch(value)) {
      return "المدخلات لا تطابق رقم هاتف";;
    }

  }
  static  ValidateDate({ String ?value}) {
    if (value!.isEmpty) {
      return "هذا الحقل لا يمكن أن يكون فارغا";
    }
    if (value.contains(" ")) {
      return "هذا الحقل لا يمكن أن يحتوي فراغات";
    }

    RegExp regex = RegExp(date.toString());
    if (!regex.hasMatch(value)) {
      return "المدخلات لا تطابق تاريخ";;
    }

  }







}