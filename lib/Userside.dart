import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertest/UserRegistrationModel.dart';

class UserSide extends StatefulWidget {
  @override
  _UserSideState createState() => _UserSideState();
}

class _UserSideState extends State<UserSide> {
  TextEditingController firstNameField = new TextEditingController();
  TextEditingController lastNameField = new TextEditingController();
  TextEditingController mobileField = new TextEditingController();
  TextEditingController emailField = new TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //Firebase
  CollectionReference collectionReference =
      Firestore.instance.collection("resgistration");
  final Firestore databaseReference = Firestore.instance;

  void createRecord(UserRegistration userRegistration) async {
    Random random = new Random();
    int randomNumber = random.nextInt(9000);
    await databaseReference
        .collection("registration")
        .document(randomNumber.toString())
        .setData({
      'id': randomNumber.toString(),
      'firstName': userRegistration.firstName,
      'lastName': userRegistration.lastName,
      'phone': userRegistration.phoneNumber,
      'email': userRegistration.email,
      'isApproved': false
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text("User Side Registration"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: firstNameField,
                decoration: const InputDecoration(
                  icon: Icon(Icons.account_circle, color: Colors.deepOrange),
                  hintText: 'First Name',
                ),
                onSaved: (String value) {
                  // This optional block of code can be used to run
                  // code when the user saves the form.
                },
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Text is empty';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: lastNameField,
                decoration: const InputDecoration(
                  icon: Icon(Icons.account_circle, color: Colors.deepOrange),
                  hintText: 'Last Name',
                ),
                onSaved: (String value) {
                  // This optional block of code can be used to run
                  // code when the user saves the form.
                },
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Text is empty';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10.0),
              TextFormField(
                keyboardType: TextInputType.phone,
                controller: mobileField,
                decoration: const InputDecoration(
                  icon: Icon(Icons.phone_android, color: Colors.deepOrange),
                  hintText: 'Phone Number',
                ),
                onSaved: (String value) {
                  // This optional block of code can be used to run
                  // code when the user saves the form.
                },
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Text is empty';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: emailField,
                decoration: const InputDecoration(
                  icon: Icon(Icons.email, color: Colors.deepOrange),
                  hintText: 'Email Address',
                ),
                keyboardType: TextInputType.emailAddress,
                onSaved: (String value) {
                  // This optional block of code can be used to run
                  // code when the user saves the form.
                },
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Text is empty';
                  }
                  return null;
                },
              ),
              SizedBox(height: 30.0),
              RaisedButton(
                color: Colors.deepOrange,
                textColor: Colors.white,
                elevation: 10.0,
                child: Text("Register"),
                onPressed: () {
                  setState(() {
                    if (_formKey.currentState.validate()) {
                      createRecord(UserRegistration(
                          firstName: firstNameField.text,
                          lastName: lastNameField.text,
                          phoneNumber: mobileField.text,
                          email: emailField.text));
                    } else {}
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
