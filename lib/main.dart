import 'dart:convert';

import 'package:dsapp/Screen/home_page.dart';
import 'package:dsapp/Screen/filterchip.dart';
import 'package:dsapp/Screen/home_page.dart';
import 'package:dsapp/forget_password.dart';
import 'package:dsapp/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: loginpage(),
    );
  }
}

class loginpage extends StatefulWidget {
  const loginpage({Key? key}) : super(key: key);

  @override
  _loginpageState createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  final email = TextEditingController();
  final password = TextEditingController();

  Future signin(BuildContext conte) async {
    //ignore: unrelated_type_equality_checks
    if (email.text == "" || password.text == "") {
      Fluttertoast.showToast(
          msg: "Fill username and password",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.black,
          textColor: Colors.white);
    } else {
      var uri = Uri.parse('http://diasoft.in/neweasy/ajax/logincheck.php');
      var respo = await http.post(uri, body: {
        "email": email.text,
        "password": password.text,
      });

      // setState(() {
      //   print(email.text);
      // });
      print(respo.body);

      var Adata = jsonDecode(respo.body);
      // ignore: unrelated_type_equality_checks
      // if (Adata[email] != "") {
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => HomePage(
      //               emailData: email.text,
      //             )),
      //   );
      // } else {
      //   Fluttertoast.showToast(
      //       msg: respo.body,
      //       toastLength: Toast.LENGTH_SHORT,
      //       gravity: ToastGravity.CENTER,
      //       timeInSecForIosWeb: 4,
      //       backgroundColor: Colors.red,
      //       textColor: Colors.white);
      // }

      if(Adata == "User Not Found"){
        Fluttertoast.showToast(
          msg: "User Not Found",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.black,
          textColor: Colors.white);
      } else if(Adata == "Wrong Password"){
        Fluttertoast.showToast(
          msg: "Wrong Password",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.black,
          textColor: Colors.white);

      } else {
         Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HomePage(
                    emailData: email.text,
                    homepageaccountdetails: Adata,
                  )),
        );
      }
    }
  }

  GlobalKey<FormState> fromk = GlobalKey<FormState>();

  // void validate(){
  //   var currentState = fromk.currentState;
  //   if(currentState!.validate()){

  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
            title: Center(
          child: Text(
            "DIASOFT SOFTWARE SOLUTIONS",
            style: TextStyle(
                fontStyle: FontStyle.italic,
                fontFamily: 'quando',
                fontSize: 15.0),
          ),
        )),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Center(
              child: Center(
                child: Card(
                  color: Colors.white,
                  child: Form(
                    key: fromk,
                    child: Column(
                      children: [
                        Center(
                          child: Form(
                              child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                // Container(decoration: new BoxDecoration(
                                //   shape: BoxShape.circle,
                                //   image: new DecorationImage(image:new NetworkImage(url)),
                                // )),

                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Image.asset(
                                    "assets/diasoft logo.png",
                                    width: 200,
                                    height: 200,
                                  ),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                TextFormField(
                                  controller: email,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                      labelText: "Email address",
                                      border: OutlineInputBorder(),
                                      prefixIcon:
                                          Icon(Icons.mail_outline_outlined),
                                      hintText:
                                          "Please Enter Your Email Address"),
                                  validator: (String? value) {
                                    if (value!.isEmpty) {
                                      return "Email is Required";
                                    } else if (!RegExp(
                                      r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?",
                                    ).hasMatch(value)) {
                                      return 'Please enter a valid email Address';
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: password,
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.lock),
                                      labelText: "Password",
                                      border: OutlineInputBorder(),
                                      hintText: "Please enter Password"),
                                  obscureText: true,
                                  validator: (String? value) {
                                    if (value!.isEmpty) {
                                      return "Password is Required";
                                    } else if (!RegExp(
                                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
                                            caseSensitive: true)
                                        .hasMatch(value)) {
                                      return 'Please enter a valid Password';
                                    }
                                  },
                                )
                              ],
                            ),
                          )),
                        ),
                        // ignore: deprecated_member_use
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: SizedBox(
                            height: 45, width: 500,
                            // ignore: deprecated_member_use
                            child: RaisedButton(
                                onPressed: () {
                                  // validate();
                                  signin(context);
                                },
                                child: Text(
                                  "Log In",
                                  style: TextStyle(fontSize: 22),
                                ),
                                color: Colors.purple,
                                textColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15))),
                          ),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // ignore: deprecated_member_use
                            FlatButton(
                                padding: EdgeInsets.all(15),
                                textColor: Colors.purple,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ForgetPassword()));
                                },
                                child: Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17.0),
                                )),

                            // ignore: deprecated_member_use
                            FlatButton(
                                padding: EdgeInsets.all(15),
                                textColor: Colors.purple,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignUpPage()));
                                },
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17.0),
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
