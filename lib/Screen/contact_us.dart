import 'package:dsapp/constants.dart';
import 'package:dsapp/Screen/bottom_navigator.dart';
import 'package:dsapp/Screen/drawer.dart';
import 'package:dsapp/Screen/filterchip.dart';
import 'package:dsapp/Screen/google_map.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_swiper/flutter_swiper.dart';

class ContactUs extends StatefulWidget {
  var contactusemail;
ContactUs({Key? key, this.contactusemail}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
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
      drawer: DrawerInfo(emaildata: widget.contactusemail,),
      appBar: AppBar(
        title: Text("Contact US"),
        backgroundColor: Colors.purple,
      
      ),
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,

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
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ListView(
                    padding: EdgeInsets.only(top: 50),
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    children: [
                      Card(
                        color: Colors.purple,
                        child: ListTile(
                          // ignore: unnecessary_statements
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => GoogleUs()));
                          },
                          leading: Icon(
                            Icons.location_on_outlined,
                            color: Colors.white,
                            size: 40,
                          ),
                          title: Text(
                            'Location:',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            'Pride Paradise , Near Credai Office Market Yard , Sangli , Maharashtra , India',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Card(
                        color: Colors.purple,
                        child: ListTile(
                          leading: Icon(
                            Icons.email_outlined,
                            color: Colors.white,
                            size: 40,
                          ),
                          title: Text(
                            'Email:',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            'nitin@diasoft.in',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Card(
                        color: Colors.purple,
                        child: ListTile(
                          leading: Icon(
                            Icons.mobile_friendly,
                            color: Colors.white,
                            size: 40,
                          ),
                          title: Text(
                            'Call:',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            '+91 98229 49149',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: BottomNavigator(bottomemail: widget.contactusemail,),
        )
      ]),
    );
  }
}
