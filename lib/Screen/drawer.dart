import 'dart:convert';
import 'dart:ui';
import 'dart:io';

import 'package:dsapp/Screen/account_details.dart';
import 'package:dsapp/Screen/edit_account_details.dart';
import 'package:dsapp/Screen/change_password.dart';
import 'package:dsapp/Screen/filterchip.dart';
import 'package:dsapp/Screen/menu_items.dart';
import 'package:dsapp/main.dart';
import 'package:http/http.dart' as http;
import 'package:dsapp/Screen/about_us.dart';
import 'package:dsapp/Screen/contact_us.dart';
import 'package:dsapp/Screen/home_page.dart';
import 'package:dsapp/Screen/why_us.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DrawerInfo extends StatefulWidget {
  var emaildata;
  var drawerinfoaccountdetails;

  DrawerInfo({Key? key, this.emaildata, this.drawerinfoaccountdetails})
      : super(key: key);

  @override
  _DrawerInfoState createState() => _DrawerInfoState();
}

class _DrawerInfoState extends State<DrawerInfo> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: 
             ListView(
              children: [
                UserAccountsDrawerHeader(
                  otherAccountsPictures: [
                    PopupMenuButton<MenuItem>(
                        onSelected: choiceAction,
                        itemBuilder: (context) => [
                              ...MenuItems.choices.map((MenuItem choose) {
                                return PopupMenuItem<MenuItem>(
                                  value: choose,
                                  child: Row(
                                    children: [
                                      Icon(choose.icon),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Text(choose.text),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ])
                  ],
                  accountName: Text(widget.emaildata),
                  accountEmail: Text(widget.emaildata),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage('assets/diasoft logo.png'),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Home"),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => HomePage(
                              emailData: widget.emaildata,
                            )));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.people_alt),
                  title: Text("About Us"),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AboutUs(
                              aboutusemail: widget.emaildata,
                            )));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.home_repair_service_sharp),
                  title: Text("Why Us"),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => WhyUs(
                              whyusemail: widget.emaildata,
                            )));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.contact_phone),
                  title: Text("Contact Us"),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            ContactUs(contactusemail: widget.emaildata)));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.search_sharp),
                  title: Text("Search Stock"),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FilterChipDisplay(
                                filterchipemail: widget.emaildata)));
                  },
                ),
                // ListTile(
                //   leading: Icon(Icons.vpn_key),
                //   title: Text("Change Password"),
                //   onTap: () {
                //     Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (context) => ChangePasswordPage(
                //                   changepassemail: widget.emaildata,
                //                 )));
                //   },
                // ),
                ListTile(
                  leading: Icon(Icons.logout),
                  title: Text("Sign out"),
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => loginpage()));
                  },
                )
              ],
            ),
          
    );
  }

  void choiceAction(MenuItem choose) {
    if (choose == MenuItems.accouontDetails) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AccountDetailsPage(
                    accountdetailspageemail: widget.emaildata,
                  )));
    } else if (choose == MenuItems.changePassword) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ChangePasswordPage(
                    changepassemail: widget.emaildata,
                  )));
    } else if (choose == MenuItems.signOut) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => loginpage()));
    }
  }
}
