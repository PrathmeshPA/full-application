// ignore_for_file: must_be_immutable

import 'package:dsapp/constants.dart';
import 'package:dsapp/Screen/bottom_navigator.dart';
import 'package:dsapp/Screen/drawer.dart';
import 'package:dsapp/Screen/filterchip.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  var  emailData;
  var homepageaccountdetails;
  HomePage({Key? key, this.emailData,this.homepageaccountdetails}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: DrawerInfo(
        emaildata: widget.emailData,
        drawerinfoaccountdetails: widget.homepageaccountdetails,
      ),
      backgroundColor: gradientEndColor,
      appBar: AppBar(
        title: Text("Home Page"),
        backgroundColor: Colors.purple,
        // elevation: 0.0,
      ),
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            //     gradient: LinearGradient(
            //   colors: [gradientStartColor, gradientEndColor],
            //   begin: Alignment.topCenter,
            //   end: Alignment.bottomCenter,
            // ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
                top: 20, right: 20, left: 20, bottom: 0.0),
            child: Card(
              elevation: 12,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              color: Colors.white,
              child: Container(
                width: size.width,
                height: size.height,
                child: Material(
                  color: Colors.purple,
                  elevation: 10.0,
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 10.0,
                          ),
                          child: Material(
                            elevation: 5.0,
                            borderRadius: BorderRadius.circular(100.0),
                            child: Container(
                              height: 200.0,
                              width: 200.0,
                              child: ClipOval(
                                child: Image.asset('assets/home.png'),
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            "WEB. CLOUD. MOBILE. DESKTOP. WE DO IT ALL.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24.0,
                              color: Colors.white,
                              fontFamily: "Alike",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            "Better Solutions For Your Business. With Diasoft, You're in Safe Hands. Diasoft is a successful, India based, software development company with a track record of delivering complex projects on time and within budget.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: BottomNavigator(
            bottomemail: widget.emailData,
          ),
        )
      ]),
    );
  }
}
