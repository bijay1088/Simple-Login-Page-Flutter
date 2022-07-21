import 'package:flutter/material.dart';
import 'package:login/Screen/login_page.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(
    GetMaterialApp(
      home: Login_page(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    ),
  );
}
