import 'package:dsapp/Screen/bottom_navigator.dart';
import 'package:dsapp/Screen/drawer.dart';
import 'package:dsapp/constants.dart';
import 'package:flutter/material.dart';


class AboutUs extends StatefulWidget {
  var aboutusemail;
  AboutUs({Key? key, this.aboutusemail}) : super(key: key);

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  int currentIndex = 0;

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: DrawerInfo(emaildata: widget.aboutusemail,),

      appBar: AppBar(
        title: Text("About US"),
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
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
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
                                  child: Image.asset('assets/11.png'),
                                ),
                              ),
                            ),
                          ),
                          // Center(
                          //   child: Text(
                          //     "WEB. CLOUD. MOBILE. DESKTOP. WE DO IT ALL.",
                          //     textAlign: TextAlign.center,
                          //     style: TextStyle(
                          //       fontSize: 24.0,
                          //       color: Colors.white,
                          //       fontFamily: "Alike",
                          //       fontWeight: FontWeight.w700,
                          //     ),
                          //   ),
                          // ),
                          Container(
                            padding: EdgeInsets.all(20.0),
                            child: Text(
                              "We are known for our attention to detail, our emphasis on clear, jargon-free communication, our depth of technical expertise, our understanding of how technology is evolving, and most importantly how our work can affect your bottom line. We take the long view, building trust by delivering robust technology solutions that stand the test of time. At Diasoft we have an excellent team of India based software developers. Whatever the problem with your existing systems, we'll help you solve it. Even if you're not sure about the specifics of what your organisation needs, we'll look at your end goals and find a way to get there, based on our extensive experience.",
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
        ),
        Positioned(bottom: 0, left: 0, child: BottomNavigator(bottomemail: widget.aboutusemail,))
      ]),
    );
  }
}
