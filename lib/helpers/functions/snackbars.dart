import 'package:flutter/material.dart';

void showIntConnErr(BuildContext context) {
  var snackBar = const SnackBar(
    content: Text(
      'Internet baglanyşygy ýok !',
      style: TextStyle(color: Colors.white),
    ),
    duration: Duration(seconds: 3),
    backgroundColor: Colors.red,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void showSomeErr(BuildContext context, String text) {
  var snackBar = SnackBar(
    content: Text(
      text,
      style: const TextStyle(color: Colors.white),
    ),
    duration: const Duration(seconds: 3),
    backgroundColor: Colors.red,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
