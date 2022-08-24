import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget defaultButtom({
  double width = double.infinity,
  Color background = const Color.fromRGBO(26, 188, 0, 1),
  required Function function,
  required String text,
  bool isUpperCase = true,
  double? sizetext = 18.0,
}) {
  return Container(
    width: width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8.0),
      color: background,
    ),
    child: MaterialButton(
      onPressed: () {
        function();
      },
      child: Text(
        isUpperCase ? text.toUpperCase() : text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: sizetext,
          color: Colors.white,
        ),
      ),
    ),
  );
}

Widget defaultTextButton({
  required Function function,
  required String text,
  required bool isUpper,
  bool? istrue,
}) =>
    TextButton(
      onPressed: () {
        function();
      },
      child: Text(
        isUpper ? text.toUpperCase() : text,
        style: const TextStyle(
          color: Color.fromRGBO(26, 188, 0, 1),
        ),
      ),
    );

void navigatorAndRemove(context, Widget) => Navigator.pushAndRemoveUntil(
    context, MaterialPageRoute(builder: (context) => Widget), (route) => false);

Widget defualtFormField({
  required TextInputType Type,
  required TextEditingController Controller,
  Function? onsubmit,
  Function? onTap,
  String? Function(String? val)? validate,
  IconData? pre,
  bool isPassword = false,
  IconData? suff,
  Function? suffpressed,
  Function? onchange,
  Function? onSubmit,
}) =>
    TextFormField(
      keyboardType: Type,
      controller: Controller,
      onFieldSubmitted: (String value) {
        onsubmit!(value);
      },
      validator: (value) {
        return validate!(value);
      },
      obscureText: isPassword,
      decoration: InputDecoration(
        suffixIcon: suff != null
            ? IconButton(
                icon: Icon(
                  suff,
                ),
                onPressed: () {
                  suffpressed!();
                })
            : null,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
          5.0,
        )),
      ),
    );

void NavigatorTo(context, Widget) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Widget),
    );

void NavigatorAndRemove(context, Widget) => Navigator.pushAndRemoveUntil(
    context, MaterialPageRoute(builder: (context) => Widget), (route) => false);

Widget MyDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 10.0,
      ),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
    );

void ShowToast({
  required String text,
  required ToastStates state,
}) {
  Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: ChooseToatsolor(state),
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

enum ToastStates { SUCCESS, ERROR, WARMIMG }

Color ChooseToatsolor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARMIMG:
      color = Colors.amber;
      break;
  }
  return color;
}
