import 'package:flutter/material.dart';

showSnakBar(BuildContext context, String messeg) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(duration: Duration(seconds: 2), content: Text(messeg)),
  );
}