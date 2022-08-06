import 'package:blood_donation_project/Modules/donate/answer.dart';
import 'package:blood_donation_project/Modules/home/homePage/homePage.dart';
import 'package:blood_donation_project/shared/components/components.dart';
import 'package:blood_donation_project/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DonateScreen extends StatefulWidget {
  // DonateScreen({required int postID});
  @override
  State<DonateScreen> createState() => _DonateScreenState();
}

class _DonateScreenState extends State<DonateScreen> {
  List<Icon> _scoreTracker = [];
  int _questionIndex = 0;
  int _totalScore = 0;
  bool answerWasSelected = false;
  bool endOfQuiz = false;
  bool correctAnswerSelected = false;

  int acceptanceRate = 0;

  int acceptDonationRate() {
    acceptanceRate = _totalScore * 100 ~/ questions.length;
    return acceptanceRate;
  }

  void _questionAnswered(bool answerScore) {
    setState(() {
      // answer was selected
      answerWasSelected = true;
      // check if answer was correct
      if (answerScore) {
        _totalScore++;
        correctAnswerSelected = true;
      }
      // adding to the score tracker on top
      _scoreTracker.add(
        answerScore
            ? Icon(
                Icons.check_circle,
                color: Colors.green,
              )
            : Icon(
                Icons.clear,
                color: Colors.red,
              ),
      );
      //when the quiz ends
      if (_questionIndex + 1 == questions.length) {
        endOfQuiz = true;
      }
    });
  }

  void _nextQuestion() {
    setState(() {
      _questionIndex++;
      answerWasSelected = false;
      correctAnswerSelected = false;
    });
    // what happens at the end of the quiz
    if (_questionIndex >= questions.length) {
      _resetQuiz();
    }
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
      _scoreTracker = [];
      endOfQuiz = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          child: ClipPath(
            clipper: WaveClip(),
            child: Container(
              color: Colors.redAccent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.only(start: 20.w),
                        child: Text(
                          'تبرع الآن',
                          style: GoogleFonts.tajawal(
                              fontSize: 60.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          preferredSize: Size.fromHeight(kToolbarHeight + 100.h)),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Row(
                children: [
                  if (_scoreTracker.length == 0)
                    SizedBox(
                      height: 25.0,
                    ),
                  if (_scoreTracker.length > 0) ..._scoreTracker,
                ],
              ),
              Container(
                width: double.infinity,
                height: 140.0,
                margin: EdgeInsets.only(
                    top: 5.0, bottom: 10.0, left: 30.0, right: 30.0),
                padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Text(
                    questions[_questionIndex]['question'] as String,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              ...(questions[_questionIndex]['answers']
                      as List<Map<String, Object>>)
                  .map(
                (answer) => Answer(
                  answerText: answer['answerText'] as String,
                  answerColor: answerWasSelected
                      ? answer['score'] as bool
                          ? Colors.green
                          : Colors.red
                      : Colors.white,
                  answerTap: () {
                    // if answer was already selected then nothing happens onTap
                    if (answerWasSelected) {
                      return;
                    }
                    //answer is being selected
                    _questionAnswered(answer['score'] as bool);
                  },
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.only(start: 20.0),
                    child: Container(
                      width: 80.0,
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        '${_totalScore.toString()}/${questions.length}',
                        style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(end: 25.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 40.0),
                        ),
                        onPressed: () {
                          if (!answerWasSelected) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('الرجاء الإجابة على هذاا السؤال أولا'),
                            ));
                            return;
                          }
                          _nextQuestion();
                        },
                        child: Text(
                          endOfQuiz ? 'إعادة الاختبار' : 'السؤال التالي',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              if (answerWasSelected && !endOfQuiz)
                Container(
                  width: double.infinity,
                  height: 100.0,
                  margin: EdgeInsets.only(
                      top: 5.0, bottom: 10.0, left: 30.0, right: 30.0),
                  padding:
                      EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                  decoration: BoxDecoration(
                    color: correctAnswerSelected ? Colors.green : Colors.red,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: Text(
                      correctAnswerSelected ? ' ✔️ هذا صحيح' : '‼️ خطأ',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              if (endOfQuiz)
                Container(
                  width: double.infinity,
                  height: 70.0,
                  margin: EdgeInsets.only(
                      top: 5.0, bottom: 10.0, left: 20.0, right: 20.0),
                  padding:
                      EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: Text(
                      _totalScore > 4
                          ? ' ${acceptDonationRate()} :تهانينا, نيجة الاختبار هي '
                          : ' ${acceptDonationRate()} : نتيجة الاختبار هي (^///^) ',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: _totalScore > 4 ? Colors.green : Colors.red,
                      ),
                    ),
                  ),
                ),
              if (endOfQuiz)
                SizedBox(
                  height: 5.0,
                ),
              if (endOfQuiz)
                OutlinedButton(
                  onPressed: () {
                    navigatorToNew(context, HomePage());
                  },
                  child: Text('التأكيد و العودة الى الرئيسية'),
                ),
              SizedBox(
                height: 30.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
