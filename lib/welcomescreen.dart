import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeWidget extends StatefulWidget {
  @override
  _WelcomeWidgetState createState() => _WelcomeWidgetState();
}

class _WelcomeWidgetState extends State<WelcomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text("Welcome Screen"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              color: Colors.deepOrange,
              textColor: Colors.white,
              elevation: 10.0,
              child: Text("Admin Side"),
              onPressed: () {
                Navigator.pushNamed(context, "/adminSide");
              },
            ),
            SizedBox(height: 20.0),
            RaisedButton(
              color: Colors.deepOrange,
              textColor: Colors.white,
              elevation: 10.0,
              child: Text("User Side"),
              onPressed: () {
                Navigator.pushNamed(context, "/userSide");
              },
            )
          ],
        ),
      ),
    );
  }
}
