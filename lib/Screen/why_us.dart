import 'package:dsapp/constants.dart';
import 'package:dsapp/Screen/bottom_navigator.dart';
import 'package:dsapp/Screen/drawer.dart';
import 'package:dsapp/Screen/filterchip.dart';
import 'package:flutter/material.dart';


class WhyUs extends StatefulWidget {
  var whyusemail;
 WhyUs({Key? key,this.whyusemail}) : super(key: key);

  @override
  _WhyUsState createState() => _WhyUsState();
}

class _WhyUsState extends State<WhyUs> {
  List<Icon> iconnew = [
    Icon(Icons.code),
    Icon(Icons.stacked_line_chart),
    Icon(Icons.mobile_friendly),
    Icon(Icons.storage_rounded),
    Icon(Icons.settings),
    Icon(Icons.timer),
    Icon(Icons.support_agent),
    Icon(Icons.design_services_outlined),
  ];
  List<String> discrip = [
    "Using suitable technologies, we create secure, scalable software solutions that integrate with new and legacy systems to drive business growth, innovation and efficiency.",
    "We have extensive experience of creating mobile-friendly, responsive e-commerce websites and back-office systems to manage products, categories, customers, orders, invoices etc.",
    "We have expertise in providing Android & iOS mobile Applications for your business. Also we take care of integration of Web & App so as to keep udated data on both.",
    "With more years database experience than we'd care to admit we can help you with everything from query optimisation to setting up clustering and replication.",
    "It's not always right to reinvent the wheel, we will advise you on the most appropriate use of open source, off the shelf and bespoke software so that you can make the best use of your budget.",
    "We Understand the Need of the hour and we are bound to complete all project in desired time. We have stepwise strategic solution and our expert team is known to deliver the task in Time.",
    "Once your software is live we won't leave you in the lurch and our highly experienced support team offer full support with guaranteed SLA's to ensure peace of mind for your company.",
    "With a wide range of experience from different industries if there's performance or cost improvements to be made in your systems we'll find them.",
  ];

  Widget customcard(String langname, iconnew, String discrip) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: InkWell(
        onTap: () {
          // Navigator.of(context).pushReplacement(MaterialPageRoute(
          //   builder: (context) => GetJson(),
          // ));
        },
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
                      height: 50.0,
                      width: 50.0,
                      child: ClipOval(
                        child: iconnew,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    langname,
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
                    discrip,
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
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: DrawerInfo(emaildata: widget.whyusemail,),
      backgroundColor: gradientEndColor,
      appBar: AppBar(
        title: Text("Why US"),
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
                child: ListView(
                  children: [
                    customcard("Software Development", iconnew[0], discrip[0]),
                    customcard(
                        "E-Commerse & Web Development", iconnew[1], discrip[1]),
                    customcard(
                        "Mobile App Development", iconnew[2], discrip[2]),
                    customcard("Database Development", iconnew[3], discrip[3]),
                    customcard("Technical Strategy", iconnew[4], discrip[4]),
                    customcard("Time Bound Project Completion", iconnew[5],
                        discrip[5]),
                    customcard("Software Support", iconnew[6], discrip[6]),
                    customcard("Software Consultancy", iconnew[7], discrip[7]),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(bottom: 0, left: 0, child: BottomNavigator(bottomemail: widget.whyusemail,))
      ]),
    );
  }
}
