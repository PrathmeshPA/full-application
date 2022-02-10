import 'package:dsapp/Screen/about_us.dart';
import 'package:dsapp/Screen/contact_us.dart';
import 'package:dsapp/Screen/filterchip.dart';
import 'package:dsapp/Screen/home_page.dart';
import 'package:dsapp/Screen/why_us.dart';
import 'package:dsapp/constants.dart';
import 'package:flutter/material.dart';

class BottomNavigator extends StatefulWidget {
  var bottomemail;

  BottomNavigator({
    Key? key,
     this.bottomemail,
  }) : super(key: key);
  
  @override
  _BottomNavigatorState createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  int currentIndex = 0;

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
      print(widget.bottomemail);
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 80,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          CustomPaint(
            size: Size(size.width, 80),
            painter: BNBCustomPainter(),
          ),
          Center(
            heightFactor: 0.6,
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.search,
                size: 35.0,
                color: Colors.purple,
              ),
              elevation: 0.1,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FilterChipDisplay(filterchipemail: widget.bottomemail,)));
              },
              splashColor: gradientEndColor,
            ),
          ),
          Container(
            width: size.width,
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  tooltip: "Home", 
                  icon: Icon(
                    Icons.home,
                    size: 30.0,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setBottomBarIndex(0);
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomePage(emailData: widget.bottomemail,)));
                  },
                  splashColor: Colors.black,
                  
                ),
                IconButton(
                    tooltip: "About Us",
                    icon: Icon(
                      Icons.people_alt,
                      size: 30.0,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setBottomBarIndex(1);
                      Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AboutUs(aboutusemail: widget.bottomemail,)));
                    }),
                Container(
                  width: size.width * 0.20,
                ),
                IconButton(
                    tooltip: "Why Us",
                    icon: Icon(
                      Icons.home_repair_service_sharp,
                      size: 30.0,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setBottomBarIndex(2);
                      Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => WhyUs(whyusemail: widget.bottomemail,)));
                    }),
                IconButton(
                    tooltip: "Contact Us",
                    icon: Icon(
                      Icons.contact_phone,
                      size: 30.0,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setBottomBarIndex(3);
                      Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ContactUs(contactusemail: widget.bottomemail,)));
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Colors.purple.shade300
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 20); // Start
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
