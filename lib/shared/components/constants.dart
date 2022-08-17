import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:blood_donation_project/Models/google_map_markers/hospital_marker.dart';
import 'package:blood_donation_project/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../Models/onBoarding/onBoardingModel.dart';

import '../network/local/cachehelper.dart';

List<OnBoardingModel> onBoardingObject = [
  OnBoardingModel(
      tittle: ' من فوائد التبرع بالدم',
      details: 'يقلل من مخاطر الإصابة بأمراض القلب والجلطات',
      urlImage: 'assets/images/image_slider1.png'),
  OnBoardingModel(
      tittle: 'من فوائد التبرع بالدم',
      details: 'يخفض ضغط الدم والكوليسترول',
      urlImage: 'assets/images/image_slider2.png'),
  OnBoardingModel(
      tittle: 'هل تعلم !',
      details: '350 مل من الدم كافية لإنقاذ حياة 4 أشخاص',
      urlImage: 'assets/images/image_slider3.png'),
];

// ignore: constant_identifier_names
enum ToastState { SUCCESS, ERROR, WARING }

Color toastColor(ToastState state) {
  Color color;
  switch (state) {
    case ToastState.SUCCESS:
      color = Colors.green;
      break;

    case ToastState.WARING:
      color = Colors.yellow;
      break;

    case ToastState.ERROR:
      color = Colors.red;
      break;
  }
  return color;
}

// String token = CacheHelper.getData(key: 'token');

// ===*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=====

// this function for create custom marker from image PNG [ Muhammad AlRifai]
Future<Uint8List?> getBytesFromAsset(String path, int width) async {
  ByteData data = await rootBundle.load(path);
  ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
      targetWidth: width);
  ui.FrameInfo fi = await codec.getNextFrame();
  return (await fi.image.toByteData(format: ui.ImageByteFormat.png))
      ?.buffer
      .asUint8List();
}

// ===*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=====
// Example of backing data
List<Hospital> hospitals = [
  Hospital(
      name: "مشفى المواساةالجامعي",
      position: LatLng(33.51211724163267, 36.26334772309518)),
  Hospital(
      name: "مشفى الأسد الجامعي",
      position: LatLng(33.505443379745124, 36.26969758336806)),
  Hospital(
      name: "مسفى التوليد",
      position: LatLng(33.510202578482065, 36.289604780468764)),
  Hospital(
      name: "مشفى الأطفال",
      position: LatLng(33.51177742614248, 36.262189082469476)),
  Hospital(
      name: "مشفى المجتهد",
      position: LatLng(33.500082116097694, 36.29539439866929)),
  Hospital(
      name: "مشفى الرشيد",
      position: LatLng(33.499977270058494, 36.302250116594266)),
  Hospital(
      name: "مشفى المهايني",
      position: LatLng(33.48868648145837, 36.29464398684215)),
  Hospital(
      name: "مشفى الرازي",
      position: LatLng(33.50438825172212, 36.261076343142015)),
];

hospitalSearch(String value) {
  for (int i = 0; i < hospitals.length; i++) {
    if (hospitals[i].name.contains(value)) {
      return hospitals[i];
    } else {
      showToast(
        msg: "عذاً تأكد من كتابة الإسم بالشكل الصحيح!",
        state: ToastState.WARING,
      );
    }
  }
}

// ===*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=====
// List Of Question to Accept the donation process of 10 elements.
final questions = const [
  {
    'question': 'هل تبرعت بالدم خلال مدة لاتتجاوز الشهرين؟',
    'answers': [
      {'answerText': 'نعم, تبرعت', 'score': false},
      {'answerText': 'لا, لم أتبرع', 'score': true},
    ],
  },
  {
    'question': 'هل عمرك أكثر من 17 سنة, ووزنك أكبر من 50 كيلو غرام؟',
    'answers': [
      {'answerText': 'نعم', 'score': true},
      {'answerText': 'لا', 'score': false},
    ],
  },
  {
    'question':
        'هل تقوم بتناول المضادات الحيوية, أو أنك مصاب بالحمى أو السعال المصاحب للبلغم؟',
    'answers': [
      {'answerText': 'نعم', 'score': false},
      {'answerText': 'لا', 'score': true},
    ],
  },
  {
    'question': 'هل تعاني من أحد أمراض الدم المعدية التالية:',
    'answers': [
      {'answerText': 'الإيدز', 'score': false},
      {'answerText': 'التهاب الكبد نوع ب أو نوع ج', 'score': false},
      {'answerText': 'لا أعاني من أي نوع', 'score': true},
    ],
  },
  {
    'question': 'هل أصبت بمرض الملاريا خلال مدة أقل من ثلاث سنوات؟',
    'answers': [
      {'answerText': 'نعم, أصبت', 'score': false},
      {'answerText': 'لا', 'score': true},
    ],
  },
  {
    'question': 'هل قمت برسم وشم خلال مدة مدة أقل من 12 شهر, أو أصبت بالجروح؟',
    'answers': [
      {'answerText': 'نعم', 'score': false},
      {'answerText': 'لا', 'score': true},
    ],
  },
  {
    'question': 'إذا كنتِ متزوجة, هل ستقومين بالتبرع بالدم خلال فترة الحمل؟',
    'answers': [
      {'answerText': 'نعم', 'score': false},
      {'answerText': 'لا', 'score': true},
      {'answerText': 'لا, أنا ذكر', 'score': true},
    ],
  },
  {
    'question': 'هل تقوم بتعاطي المخدرات بالحقن الوريدي؟',
    'answers': [
      {'answerText': 'نعم', 'score': false},
      {'answerText': 'مرة واحدة فقط منذ سنين', 'score': false},
      {'answerText': 'لا, مطلقاً', 'score': true},
    ],
  },
];
