import 'dart:convert';

import 'package:dsapp/Screen/home_page.dart';
import 'package:dsapp/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';


class ChangePasswordPage extends StatefulWidget {
  var changepassemail;
  ChangePasswordPage({
    Key? key,
    this.changepassemail,
  }) : super(key: key);

  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final email = TextEditingController();
  final oldpassword = TextEditingController();
  final newpassword = TextEditingController();
  final confirmpassword = TextEditingController();

  Future changepassword(BuildContext context) async {
    Map mapdata = {
      "email": widget.changepassemail,
      "oldpass": oldpassword.text,
      "newpass": newpassword.text,
    };

    var url = Uri.parse("http://diasoft.in/neweasy/ajax/changpass.php");
    var resp = await http.post(url, body: mapdata);
    var resultdata = jsonDecode(resp.body);


    if (resultdata == "User Not Found") {
      Fluttertoast.showToast(
          msg: "User Not Found",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.black,
          textColor: Colors.white);
    } else if (resultdata == "Wrong Old Password") {
      Fluttertoast.showToast(
          msg: "Current Password is Wrong",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.black,
          textColor: Colors.white);
    } else if (resultdata == "success") {
      Fluttertoast.showToast(
          msg: "Password Changed Successfully !",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.black,
          textColor: Colors.white);
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomePage(
                  emailData: widget.changepassemail,
                )),
      );
    }
  }

  String gemail = "";
  String oldpass = "";
  String newpass = "";
  String confirmpass = "";

  var _formkey = GlobalKey<FormState>();



  Widget _buildOldPassword() {
    return TextFormField(
      controller: oldpassword,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock_outline_rounded),
          labelText: "Current Password",
          border: OutlineInputBorder(),
          hintText: "Enter Current Password"),
      obscureText: true,
      validator: (String? value) {
        if (value!.isEmpty) {
          return "Must Enter Current Password";
        } else if (!RegExp(
                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
                caseSensitive: true)
            .hasMatch(value)) {
          return 'Please enter a valid Password';
        }
      },
      onSaved: (String? value) {
        oldpass = value!;
      },
    );
  }

  Widget _buildNewPassword() {
    return TextFormField(
      controller: newpassword,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock_outline_rounded),
          labelText: "New Password",
          border: OutlineInputBorder(),
          hintText: "Enter New Password"),
      obscureText: true,
      validator: (String? value) {
        if (value!.isEmpty) {
          return "Must Enter New Password";
        } else if (!RegExp(
                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
                caseSensitive: true)
            .hasMatch(value)) {
          return 'Please enter a valid Password';
        }
      },
      onSaved: (String? value) {
        newpass = value!;
      },
    );
  }

  Widget _buildconfirmPassword() {
    return TextFormField(
      controller: confirmpassword,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock_outline_rounded),
          labelText: "Confirm Password",
          border: OutlineInputBorder(),
          hintText: "Confirm Password"),
      obscureText: true,
      validator: (String? value) {
        if (newpassword.text != value) {
          return "Password don't Match";
        } else if (!RegExp(
                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
                caseSensitive: true)
            .hasMatch(value!)) {
          return 'Please enter a valid Password';
        }
      },
      onSaved: (String? value) {
        confirmpass = value!;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Change Password"),
      ),
      body: Container(
        margin: EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20.0,
                  ),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Email ID: ${widget.changepassemail}",
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
                  ),
                  // _buildEmail(),
                  SizedBox(
                    height: 15.0,
                  ),
                  _buildOldPassword(),
                  SizedBox(
                    height: 10.0,
                  ),
                  _buildNewPassword(),
                  SizedBox(
                    height: 10.0,
                  ),
                  _buildconfirmPassword(),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(15.0),
                          minimumSize: Size(300.0, 50.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0))),
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          _formkey.currentState!.save();

                          changepassword(context);
                        }
                      },
                      child: Text(
                        "Change Password",
                        style: TextStyle(fontSize: 20),
                      ))
                ],
              )),
        ),
      ),
    );
  }
}
