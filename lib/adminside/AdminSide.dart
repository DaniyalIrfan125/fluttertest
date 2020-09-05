import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertest/models/User.dart';

class AdminSide extends StatefulWidget {
  @override
  _AdminSideState createState() => _AdminSideState();
}

class _AdminSideState extends State<AdminSide> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  TextEditingController emailField = new TextEditingController();
  TextEditingController passwordField = new TextEditingController();
  GlobalKey<FormState> _adminformKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text("Admin Login"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _adminformKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: emailField,
                decoration: const InputDecoration(
                  icon: Icon(Icons.email, color: Colors.deepOrange),
                  hintText: 'Email',
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
                controller: passwordField,
                decoration: const InputDecoration(
                  icon: Icon(Icons.lock, color: Colors.deepOrange),
                  hintText: 'Password',
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
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.deepOrange,
                textColor: Colors.white,
                elevation: 10.0,
                child: Text("Login"),
                onPressed: () async {
                  if (_adminformKey.currentState.validate()) {
                    dynamic result = await signInWithEmailAndPasword(
                        emailField.text, passwordField.text);
                    if (result == null) {
                    } else {
                      Navigator.pushNamed(context, "/usersList");
                    }
                  } else {}
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Future signInWithEmailAndPasword(String email, String password) async {
    AuthResult authResult =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    FirebaseUser firebaseUser = authResult.user;
    return userfromFirebaseUser(firebaseUser);
  }

  User userfromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }
}
