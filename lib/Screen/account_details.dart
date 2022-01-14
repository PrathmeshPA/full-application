import 'dart:convert';

import 'package:dsapp/Screen/edit_account_details.dart';
import 'package:dsapp/Screen/profile.dart';
import 'package:dsapp/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

//import 'package:regexpattern/regexpattern.dart';

class AccountDetailsPage extends StatefulWidget {
  var accountdetailspageemail;
  AccountDetailsPage({
    Key? key,
    this.accountdetailspageemail,
  }) : super(key: key);

  @override
  _AccountDetailsPageState createState() => _AccountDetailsPageState();
}

class _AccountDetailsPageState extends State<AccountDetailsPage> {
  final firstname = TextEditingController();
  final lastname = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final mobileno = TextEditingController();

  Future sign_up(BuildContext context) async {
    // Map mapdata = {
    //   "email": widget.accountdetailspageemail,
      // "password": password.text,
      // "mobileno": mobileno.text
    // };

    //     var rec =
    //     await http.get(Uri.parse("http://diasoft.in/neweasy/ajax/getuser.php"));
    // if (rec.statusCode == 200)
    //   setState(() {
    //   resultdata = jsonDecode(rec.body) as List;
    //   });

    // var url = Uri.parse("http://diasoft.in/neweasy/ajax/getuser.php");
    // var resp = await http.post(url, body: {});
    // var resultdata = jsonDecode(resp.body);

    var uri = Uri.parse('http://diasoft.in/neweasy/ajax/getuser.php');
    var respo = await http.post(uri, body: {
      "email": widget.accountdetailspageemail,
    });

    var Adata = jsonDecode(respo.body);

    print(widget.accountdetailspageemail);

    print(Adata);

    // @override
    // void initState() {
    //   super.initState();
    //   sign_up(context);
    //   // print(resultdata);
    // }

    // setState(() {
    //   print(firstname.text);
    // });
    // var resultdata =await json.decode(json.encode(resp.body));
    // if (resultdata == "success") {
    //   print(resultdata);
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(builder: (context) => loginpage()),
    //   );
    // } else {
    //   Fluttertoast.showToast(
    //       msg: "Email Registerd",
    //       toastLength: Toast.LENGTH_SHORT,
    //       gravity: ToastGravity.CENTER,
    //       timeInSecForIosWeb: 2,
    //       backgroundColor: Colors.black,
    //       textColor: Colors.white);
    // }
  }

  String first_name = "";
  String last_name = "";
  String pass = "";
  String g_email = "";
  String p_Number = "";

  var _formkey = GlobalKey<FormState>();

  // Widget _buildFirstName() {
  //   return TextFormField(
  //     controller: firstname,
  //     decoration: InputDecoration(
  //       prefixIcon: Icon(Icons.account_box),
  //       labelText: "First Name",
  //       border: OutlineInputBorder(),
  //     ),
  //     validator: (String? value) {
  //       if (value!.isEmpty) {
  //         return "First name is Required";
  //       } else if (!RegExp(r'^[a-zA-Z]{1,16}$', caseSensitive: false)
  //           .hasMatch(value)) {
  //         return 'Invalid First Name';
  //       }
  //     },
  //     onSaved: (String? value) {
  //       first_name = value!;
  //     },
  //   );
  // }

  // Widget _buildLastName() {
  //   return TextFormField(
  //     controller: lastname,
  //     decoration: InputDecoration(
  //       prefixIcon: Icon(Icons.account_box),
  //       labelText: "Last Name",
  //       border: OutlineInputBorder(),
  //     ),
  //     validator: (String? value) {
  //       if (value!.isEmpty) {
  //         return "Last Name is Required";
  //       } else if (!RegExp(r'^[a-zA-Z]{1,16}$', caseSensitive: false)
  //           .hasMatch(value)) {
  //         return 'Invalid Last Name';
  //       }
  //     },
  //     onSaved: (String? value) {
  //       last_name = value!;
  //     },
  //   );
  // }

  // Widget _buildEmail() {
  //   return TextFormField(
  //     controller: email,
  //     keyboardType: TextInputType.emailAddress,
  //     decoration: InputDecoration(
  //         prefixIcon: Icon(Icons.mail_outline_outlined),
  //         labelText: "Email address",
  //         border: OutlineInputBorder(),
  //         hintText: "Please Enter Your Email Address"),
  //     validator: (String? value) {
  //       if (value!.isEmpty) {
  //         return "Email is Required";
  //       } else if (!RegExp(
  //         r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?",
  //       ).hasMatch(value)) {
  //         return 'Please enter a valid email Address';
  //       }
  //     },
  //     onSaved: (String? value) {
  //       g_email = value!;
  //     },
  //   );
  // }

  // Widget _buildPassword() {
  //   return TextFormField(
  //     controller: password,
  //     decoration: InputDecoration(
  //         prefixIcon: Icon(Icons.lock_outline_rounded),
  //         labelText: "Password",
  //         border: OutlineInputBorder(),
  //         hintText: "Select Password"),
  //     obscureText: true,
  //     validator: (String? value) {
  //       if (value!.isEmpty) {
  //         return "Password is Required";
  //       } else if (!RegExp(
  //               r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
  //               caseSensitive: true)
  //           .hasMatch(value)) {
  //         return 'Please enter a valid Password';
  //       }
  //     },
  //     onSaved: (String? value) {
  //       pass = value!;
  //     },
  //   );
  // }

  // Widget _buildPhoneNumber() {
  //   return TextFormField(
  //     controller: mobileno,
  //     maxLength: 10,
  //     keyboardType: TextInputType.phone,
  //     decoration: InputDecoration(
  //         prefixIcon: Icon(Icons.phone_android),
  //         labelText: "Mobile Number",
  //         border: OutlineInputBorder(),
  //         hintText: "Please Enter Your Mobile Number"),
  //     validator: (String? value) {
  //       if (value!.isEmpty) {
  //         return "Mobile Number is Required";
  //       } else if (!RegExp(r'^-?[0-9]+$').hasMatch(value)) {
  //         return 'Please enter a valid Mobile Number';
  //       }
  //     },
  //     onSaved: (String? value) {
  //       p_Number = value!;
  //     },
  //   );
  // }
  Widget buildName() => Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            leading: Icon(Icons.account_box),
            title: Text(
              'user.name',
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(height: 4),
          ListTile(
            leading: Icon(Icons.mail_rounded),
            title: Text(
              widget.accountdetailspageemail,
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(height: 4),
          ListTile(
            leading: Icon(Icons.phone_android),
            title: Text(
              'user.mobile',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account Details"),
        actions: [
          IconButton(
              onPressed: () {
                sign_up(context);
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => EditAccountDetailsPage()),
                );
              },
              icon: Icon(Icons.edit))
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Form(
              key: _formkey,
              child: Column(
                children: [
                  ProfileWidget(
                      imagePath: 'assets/diasoft logo.png',
                      onClicked: () async {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => EditAccountDetailsPage()),
                        );
                      }),
                  const SizedBox(height: 24),
                  buildName(),
                ],
              )),
        ),
      ),
    );
  }
}
