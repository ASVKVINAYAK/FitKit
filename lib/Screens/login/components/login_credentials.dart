
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'package:gym_app/constants/constants.dart';
import 'package:gym_app/Screens/home/home_screen.dart';


// ignore: must_be_immutable
class LoginCredentials extends StatelessWidget {

  TextEditingController  email = new TextEditingController();
  TextEditingController password = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: appPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Please Log In',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Material(
            elevation: 10.0,
            color: white,
            borderRadius: BorderRadius.circular(30.0),
            child: TextField(
              controller: email,
              decoration: InputDecoration(
                border:
                OutlineInputBorder(borderSide: BorderSide.none),
                contentPadding: EdgeInsets.symmetric(
                    vertical: appPadding * 0.75,
                    horizontal: appPadding),
                fillColor: white,
                hintText: 'Email Id',
                suffixIcon: Icon(
                  Icons.email_outlined,
                  size: 25.0,
                  color: black.withOpacity(0.4),
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.04,
          ),
          Material(
            elevation: 10.0,
            color: white,
            borderRadius: BorderRadius.circular(30.0),
            child: TextField(
              controller: password,
              obscureText: true,
              decoration: InputDecoration(
                border:
                OutlineInputBorder(borderSide: BorderSide.none),
                contentPadding: EdgeInsets.symmetric(
                    vertical: appPadding * 0.75,
                    horizontal: appPadding),
                fillColor: Colors.white,
                hintText: 'Password',
                suffixIcon: Icon(
                  Icons.lock_outline,
                  size: 25.0,
                  color: black.withOpacity(0.4),
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.04,
          ),
          Center(
            child: TextButton(
              onPressed:(){
                Alert(
                    context: context,
                    title: "New Register ",
                    content: Column(
                      children: <Widget>[
                        TextField(
                          controller: email,
                          decoration: InputDecoration(
                            icon: Icon(Icons.account_circle),
                            labelText: 'Email Id',
                          ),
                        ),
                        TextField(
                          controller: password,
                          obscureText: true,
                          decoration: InputDecoration(
                            icon: Icon(Icons.lock),
                            labelText: 'Password',
                          ),
                        ),
                      ],
                    ),
                    buttons: [
                      DialogButton(
                        onPressed: () {
                          // var bytes1 = utf8.encode(password.text);         // data being hashed
                          // var pass = sha256.convert(bytes1);
                          // var bytes2 = utf8.encode(pass.toString());         // data being hashed
                          // var pass2 = sha256.convert(pass.bytes);
                          // print("pass $pass2");
                          Map<String, dynamic> data = {"email": email.text, "password": password.text};
                          DocumentReference documentReference = FirebaseFirestore
                              .instance.collection('users').doc(email.text);
                          documentReference.set(data);
                          print(data);
                          Navigator.pop(context);
                          Navigator.pop(context);
                          Fluttertoast.showToast(
                              msg: "User added Successfully",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 5,
                              backgroundColor: Colors.black87,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                          // Hashing Process
                        },
                        child: Text(
                          "Register",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      )
                    ]).show();
              },
              child: Text('New Register'),
            ),
          ),
          SizedBox(
            height: size.height * 0.04,
          ),
          InkWell(
            onTap: () {
              if(email.text=="user@gmail.com"&&password.text=="user123")
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage()));
                }
              else
                {
                  Alert(
                    context: context,
                    type: AlertType.error,
                    title: "Invalid Login Credentials ",
                    buttons: [
                      DialogButton(
                        child: Text(
                          "OK",
                          style: TextStyle(color: Colors.black87, fontSize: 20),
                        ),
                        onPressed: () => Navigator.pop(context),
                        width: 120,
                      )
                    ],
                  ).show();
                }
              },
            child: Material(
                elevation: 10.0,
                shadowColor: primary,
                color: primary,
                borderRadius: BorderRadius.circular(30.0),
                child: Container(
                  width: size.width,
                  height: size.width * 0.15,
                  child: Center(
                    child: Text(
                      'Log In',
                      style: TextStyle(
                        color: white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
