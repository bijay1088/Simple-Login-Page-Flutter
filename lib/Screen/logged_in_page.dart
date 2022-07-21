import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoggedInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logged In Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('You have succesfully logged in.'),
          ],
        ),
      ),
    );
  }
}
