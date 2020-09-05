import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UsersList extends StatefulWidget {
  @override
  _UsersListState createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  QuerySnapshot queryRegisterUser;

  Widget ListItemBuilder() {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
      ),
      body: Container(
        child: Column(
          children: <Widget>[

        queryRegisterUser != null? ListView.builder(
            itemCount: queryRegisterUser.documents.length,
            itemBuilder: (context, index) {
              return ListItem(
                  fullName:
                  queryRegisterUser.documents[index].data['fullName'],
                  lastName:
                  queryRegisterUser.documents[index].data['lastName'],
                  email: queryRegisterUser.documents[index].data['email'],
                  phoneNumber:
                  queryRegisterUser.documents[index].data['phoneNumber']);
            }) : Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator())




          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getData().then((onValue){
      this.queryRegisterUser= onValue;
    });
  }
  @override
  Widget build(BuildContext context) {
    return ListItemBuilder();
  }

 Future<QuerySnapshot> getData() async {

    return await Firestore.instance.collection("registration").getDocuments();
  }
}

class ListItem extends StatelessWidget {
  String fullName, lastName, email, phoneNumber;

  ListItem({this.fullName, this.lastName, this.email, this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
      ),
      body: Container(
        height: 100,
        child: Row(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(fullName),
                Text(lastName),
                Text(phoneNumber),
                Text(email),
              ],
            ),
            SizedBox(width: 10),
            RaisedButton(
                color: Colors.deepOrange,
                textColor: Colors.white,
                elevation: 10.0,
                child: Text("Approve"),
                onPressed: () {}),
            SizedBox(width: 10),
            RaisedButton(
                color: Colors.deepOrange,
                textColor: Colors.white,
                elevation: 10.0,
                child: Text("Reject"),
                onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
