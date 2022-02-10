import 'dart:convert';
import 'dart:io';

// import 'package:dsapp/Screen/profile.dart';
import 'package:dsapp/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

//import 'package:regexpattern/regexpattern.dart';

class EditAccountDetailsPage extends StatefulWidget {
  const EditAccountDetailsPage({Key? key}) : super(key: key);

  @override
  _EditAccountDetailsPageState createState() => _EditAccountDetailsPageState();
}

class _EditAccountDetailsPageState extends State<EditAccountDetailsPage> {
  final firstname = TextEditingController(text:"");
  final lastname = TextEditingController();
  final email = TextEditingController(text: 'zx@gmail.com');
  final password = TextEditingController();
  final mobileno = TextEditingController();

   File? image;
   
  Future sign_up(BuildContext context) async {
    Map mapdata = {
      "image":image,
    };

    var url = Uri.parse("http://192.168.29.222/image.php");
    var resp = await http.post(url, body: mapdata);
    var resultdata = jsonDecode(resp.body);
    // var resultdata = await json.decode(json.encode(resp.body));
    if (resultdata == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => loginpage()),
      );
    }
  }

  String first_name = "";
  String last_name = "";
  String g_email = "";
  String p_Number = "";

  var _formkey = GlobalKey<FormState>();

 

  Future showImageSource(BuildContext context) async {
    return showModalBottomSheet(
        context: context,
        builder: (context) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                    leading: Icon(Icons.camera_alt),
                    title: Text('Camera'),
                    onTap: () async {
                      final pickedImage = await ImagePicker()
                          .pickImage(source: ImageSource.camera);
                      Navigator.of(context).pop(ImageSource.camera);
                      setState(() {
                        image = File(pickedImage!.path);
                      });
                    }),
                ListTile(
                  leading: Icon(Icons.image),
                  title: Text('Gallery'),
                  onTap: () async {
                    final pickedImage = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);
                        Navigator.of(context).pop(ImageSource.gallery);
                    setState(() {
                      image = File(pickedImage!.path);
                    });
                  },
                ),
              ],
            ));
  }

  // Future pickCamera() async {
  //   final pickedimage =
  //       await ImagePicker().pickImage(source: ImageSource.camera);

  //   setState(() {
  //     image = File(pickedimage!.path);
  //   });

  //   // setState(() => this.image = imageTemporary);
  // }

  // Future pickGallery() async {
  //   final pickedimage =
  //       await ImagePicker().pickImage(source: ImageSource.gallery);

  //   setState(() {
  //     image = File(pickedimage!.path);
  //   });

  //   // setState(() => this.image = imageTemporary);
  // }

  Widget _buildFirstName() {
    return TextFormField(
      controller: firstname,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.account_box),
        labelText: "First Name",
        border: OutlineInputBorder(),
      ),
      // validator: (String? value) {
      //   if (value!.isEmpty) {
      //     return "First name is Required";
      //   } else if (!RegExp(r'^[a-zA-Z]{1,16}$', caseSensitive: false)
      //       .hasMatch(value)) {
      //     return 'Invalid First Name';
      //   }
      // },
      onSaved: (String? value) {
        first_name = value!;
      },
    );
  }

  Widget _buildLastName() {
    return TextFormField(
      controller: lastname,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.account_box),
        labelText: "Last Name",
        border: OutlineInputBorder(),
      ),
      // validator: (String? value) {
      //   if (value!.isEmpty) {
      //     return "Last Name is Required";
      //   } else if (!RegExp(r'^[a-zA-Z]{1,16}$', caseSensitive: false)
      //       .hasMatch(value)) {
      //     return 'Invalid Last Name';
      //   }
      // },
      onSaved: (String? value) {
        last_name = value!;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      controller: email,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail_outline_outlined),
          labelText: "Email address",
          border: OutlineInputBorder(),
          hintText: "Please Enter Your Email Address"),
      // validator: (String? value) {
      //   if (value!.isEmpty) {
      //     return "Email is Required";
      //   } else if (!RegExp(
      //     r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?",
      //   ).hasMatch(value)) {
      //     return 'Please enter a valid email Address';
      //   }
      // },
      onSaved: (String? value) {
        g_email = value!;
      },
    );
  }

 

  Widget _buildPhoneNumber() {
    return TextFormField(
      controller: mobileno,
      maxLength: 10,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.phone_android),
          labelText: "Mobile Number",
          border: OutlineInputBorder(),
          hintText: "Please Enter Your Mobile Number"),
      // validator: (String? value) {
      //   if (value!.isEmpty) {
      //     return "Mobile Number is Required";
      //   } else if (!RegExp(r'^-?[0-9]+$').hasMatch(value)) {
      //     return 'Please enter a valid Mobile Number';
      //   }
      // },
      onSaved: (String? value) {
        p_Number = value!;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Details"),
      ),
      body: Container(
        margin: EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Form(
              key: _formkey,
              child: Column(
                children: [
                  SizedBox(
                    height: 20.0,
                  ),

                  InkWell(
                    onTap: () => showImageSource(context),
                    child: image == null
                        ? Image.asset('assets/diasoft logo.png')
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(200.0),
                            child: Image.file(
                              image!,
                              fit: BoxFit.cover,
                              height: 200,
                              width: 200,
                            )),
                  ),

                  // ProfileWidget(
                  //     imagePath: 'assets/diasoft logo.png',
                  //     onClicked: pickImage),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: _buildFirstName(),
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Expanded(child: _buildLastName()),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  // _buildUserName(),
                  // SizedBox(
                  //   height: 10.0,
                  // ),
                  _buildEmail(),
                  SizedBox(
                    height: 10.0,
                  ),
                  // _buildPassword(),
                  // SizedBox(
                  //   height: 10.0,
                  // ),

                  _buildPhoneNumber(),
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
                          sign_up(context);

                          _formkey.currentState!.save();
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => loginpage()),
                          );
                        }

                        // print(_username);
                        // print(_password);
                        // print(_email);
                        // print(_phoneNumber);
                        // Navigator.of(context).push(MaterialPageRoute(
                        //   builder: (context) => loginpage()
                        // ));
                      },
                      child: Text(
                        "Save",
                        style: TextStyle(fontSize: 20),
                      ))
                ],
              )),
        ),
      ),
    );
  }
}
