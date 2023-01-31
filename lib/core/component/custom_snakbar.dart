import 'package:flutter/material.dart';

void customShowSnackBar(BuildContext context,String content){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(content)));
}