import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'constants.dart';

Widget buildItem(business, context ){
  return  Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Container(
          width: 120.0,
          height: 120.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: NetworkImage('${business['urlToImage']}'),
                fit: BoxFit.cover,
              )
          ),
        ),
        const SizedBox(width: 20,),
        Expanded(
          // ignore: sized_box_for_whitespace
          child: Container(
            height: 120.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Text("${business['title']}",style:Theme.of(context).textTheme.bodyText1 ,maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                Expanded(
                  child: Text("${business['publishedAt']}",style: const TextStyle(
                      color: Colors.grey
                  ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                )

              ],
            ),
          ),
        ),
      ],
    ),
  );
}
Widget myDriver()=> Padding(
  padding: const EdgeInsetsDirectional.only(start:20),
  child: Container(
    width: double.infinity,
    height: 1,
    color: Colors.grey,
  ),
);
void navigatorTo(context,Widget screen){
  Navigator.push(context,MaterialPageRoute(builder: (context)=>screen));
}
void navigatorToNew(context,Widget screen){
  Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context)=>screen),
          (route) => false);
}

Widget defaultTextFormField({
  required TextEditingController controller,
  required TextInputType type,
  required String label,
   Icon ? prefix,
  required Function valid,
  bool correct = true,
  bool focus = true,
  bool isPassword = false,
  bool enable = true,
  Icon? suffix,
  Function? onChanged,
  Function? onSubmitted,
  Function? suffixPressed,
  //Function ?onTap,
}) =>
    TextFormField(
      enabled: enable,
      validator: (s) {
        valid();
        return null;

        },
      // onTap: (){
      //   onTap!();
      // },
      controller: controller,
      keyboardType: type,
      autocorrect: true,
      autofocus: true,
      textAlign: TextAlign.start,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        labelStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
        prefixIcon: prefix,
        suffixIcon: suffix != null
            ? IconButton(
          icon: suffix,
          onPressed: (){
            suffixPressed!();
          },
        )
            : null,
      ),
      onChanged: (s){
        onChanged !();
      },
      onFieldSubmitted: (s){
        onSubmitted!();
      },
    );



Widget defaultTextButton({required String text,required Function function,Color color = Colors.white}){
  return TextButton(onPressed: (){
    function();
  }, child: Text(text.toUpperCase(),style: TextStyle(
    color:color
  ),));
}


void showToast({required String msg,required ToastState state})=> Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: toastColor(state),
      textColor: Colors.white,
      fontSize: 16.0
  );