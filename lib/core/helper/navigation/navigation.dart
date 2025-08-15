import 'package:flutter/material.dart';

Future<T?> pushNameed<T>(BuildContext context, Object? arguments, String routeName) async {
  return await Navigator.pushNamed(
    arguments:arguments,
    context,
   routeName
  );
}

Future<T?> pushReplacement<T>(BuildContext context,Widget screen) async {
  return await Navigator.pushReplacement(
  
    context,
 MaterialPageRoute(builder: (context)=>screen)
  );
}
Future<T?> pushTo<T>(BuildContext context, Widget screen) async {
  return await Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => screen,
    ),
  );
}