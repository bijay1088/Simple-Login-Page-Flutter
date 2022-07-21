import 'package:flutter/material.dart';
import 'package:login/Screen/logged_in_page.dart';
import 'package:login/login_verify/login_verify.dart';
import 'package:get/get.dart';

class Login_page extends StatefulWidget {
  homepage createState() => homepage();
}

class homepage extends State<Login_page> {
  final username = TextEditingController();
  final password = TextEditingController();

  bool validate1 = false;
  bool validate2 = false;
  bool validate3 = false;

  @override
  void dispose() {
    username.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 150),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                controller: username,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Username",
                  hintText: "Enter your username",
                  errorText: (validate1)
                      ? "Username Can't Be Empty"
                      : (validate3)
                          ? "Your information is not correct."
                          : null,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                controller: password,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Password",
                  hintText: "Enter your password",
                  errorText: (validate2)
                      ? "Password Can't Be Empty"
                      : (validate3)
                          ? "Your information is not correct."
                          : null,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  username.text.isEmpty ? validate1 = true : validate1 = false;
                  password.text.isEmpty ? validate2 = true : validate2 = false;
                });
                final Login_verify verify = Login_verify();
                String status =
                    verify.verify_login(username.text, password.text);
                if (status == "true") {
                  validate1 = false;
                  validate2 = false;
                  validate3 = false;
                  showAlertDialog(context);
                } else {
                  validate3 = true;
                }
              },
              child: (const Text("Login")),
            ),
          ],
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  // Create button
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
      Get.to(() => LoggedInPage());
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Successful."),
    content: const Text("You have logged in successfully."),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
