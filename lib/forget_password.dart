import 'package:dsapp/main.dart';
import 'package:flutter/material.dart';

import 'package:email_auth/email_auth.dart';


class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  String _email = "";

  final TextEditingController _emailcontroller = TextEditingController();

  var _formkey = GlobalKey<FormState>();
  // ignore: avoid_init_to_null

  Widget _buildForgotEmail() {
    return TextFormField(
      controller: _emailcontroller,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Email address",
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.email),
        hintText: "Please Enter Your Email Adress",
        // suffixIcon: TextButton(
        //     onPressed: () {
        //       if (!_formkey.currentState!.validate()) {
        //         return;
        //       }
        //       _formkey.currentState!.save();
        //     },
        //     child: Text("Verify")),
      ),
      validator: (String? value) {
        if (value!.isEmpty) {
          return "Email is Required";
        }
        if (!RegExp(
          r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?",
        ).hasMatch(value)) {
          return 'Please enter a valid email Address';
        }
      },
      onSaved: (String? value) {
        _email = value!;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var onpressed = null;
    String isEmailVerified = "No";

    if (isEmailVerified == "Yes") {
      onpressed = () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => loginpage(),
        ));
      };
    }

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.blue, Colors.blue.shade200]),
      ),
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text("Reset Password"),
        // ),
        backgroundColor: Colors.transparent,
        body: Form(
          key: _formkey,
          child: Stack(
            children: [
              Container(
                height: height * 0.15,
              ),
              Container(
                margin: EdgeInsets.only(
                  top: height * 0.15,
                  left: height * 0.02,
                  right: height * 0.02,
                  bottom: height * 0.02,
                ),
                height: height * 0.85,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    )),
                child: ListView(
                  children: [
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Text(
                      "Forget Password",
                      style: TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Center(
                      child: Container(
                        height: 1,
                        width: width * 0.8,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(17.0),
                      child: _buildForgotEmail(),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(
                    //       left: 17.0, right: 17.0, top: 1.0),
                    //   child: _buildOtp(),
                    // ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 17.0, right: 17.0, top: 5.0, bottom: 5.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                if (!_formkey.currentState!.validate()) {
                                  return;
                                }
                                _formkey.currentState!.save();

                                // Navigator.of(context).push(MaterialPageRoute(
                                //   builder: (context) => LoginPage(),
                                // ));
                              },
                              child: Text("Verify Email"),
                            ),
                          ),
                          SizedBox(
                            width: width * 0.03,
                          ),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: onpressed,
                              child: Text("Reset Password"),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
