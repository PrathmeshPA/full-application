import 'package:dsapp/Screen/drawer.dart';
import 'package:dsapp/Screen/listcontroll.dart';
import 'package:dsapp/Screen/new_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

List<dynamic> shname = [
  "ROUND",
  "CUSHION",
  "PEAR",
  "OVAL",
  "PRINCESS",
  "HEART",
  "RADIANT",
  "EMERALD",
  "ASSCHER",
  "MARQUISE",
];

List<dynamic> colname = [
  "D",
  "E",
  "F",
  "G",
  "H",
  "I",
  "J",
  "K",
  "L",
  "M",
  "N",
];

List<dynamic> Clarity = [
  "IF",
  "VVS1",
  "VVS2",
  "VS1",
  "VS2",
  "SI1",
  "SI2",
  "SI3",
  "I1",
  "I2",
  "I3",
];

List<dynamic> Labcert = ["GIA", "IGI", "GSI"];

List<dynamic> _size = [
  "(0.01 - 0.03)",
  "(0.04 - 0.07)",
  "(0.08 - 0.14)",
  "(0.15 - 0.17)",
  "(0.18 - 0.22)",
  "(0.30 - 0.39)",
  "(0.40 - 0.49)",
  "(0.50 - 0.69)",
  "(0.70 - 0.89)",
  "(0.90 - 0.99)",
  "(1.00 - 1.49)",
  "(1.50 - 1.99)",
  "(2.00 - 2.99)",
  "(3.00 - 3.99)",
  "(4.00 - 4.99)",
  "(5.00 - 5.99)",
  "(10.00 - 10.99)",
  "(11.00 - 14.99)"
];

List<dynamic> _pol = ["EX", "VG", "GD", "F"];

List<dynamic> _sym = ["EX", "VG", "GD", "F"];

class FilterChipDisplay extends StatefulWidget {
  // late final filterv filterveg;

  var filterchipemail;
  FilterChipDisplay({Key? key,this.filterchipemail}) : super(key: key);
  @override
  _FilterChipDisplayState createState() => _FilterChipDisplayState();
}

class _FilterChipDisplayState extends State<FilterChipDisplay> {
  var controller = Get.put(selectcontroll());
  var colorname = Get.put(selectcolor());
  var claritynm = Get.put(selectclarity());
  var certnm = Get.put(selectcertificate());
  var size = Get.put(SelectSize());
  var polish = Get.put(selectpolish());
  var symmetry = Get.put(selectsymmetry());

//   List ondataa = [];
// late String chooseval;
  @override
  void initState() {
    super.initState();
    // fdata();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //     icon: Icon(
        //       Icons.menu,
        //       color: Colors.white,
        //     ),
        //     onPressed: () {}),
        title: Text(
          "Search Categories",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.check,
              ),
              onPressed: () async {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Newapi()));
                //   // );
                // });
              }),
        ],
      ),
      drawer: DrawerInfo(emaildata: widget.filterchipemail,),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Shapes",
                  style: TextStyle(
                      color: Colors.purple,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Wrap(
                    spacing: 5.0,
                    runSpacing: 3.0,
                    children: shname.map((b) => shape(b)).toList(),
                  ),
                ),
              ),
            ),
            Divider(
              color: Colors.purple,
              height: 10.0,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Colors',
                  style: TextStyle(
                      color: Colors.purple,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Wrap(
                    spacing: 5.0,
                    runSpacing: 5.0,
                    children: colname.map((a) => cname(a)).toList(),
                  ),
                ),
              ),
            ),
            Divider(
              color: Colors.purple,
              height: 10.0,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Clarity',
                  style: TextStyle(
                      color: Colors.purple,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Wrap(
                    spacing: 5.0,
                    runSpacing: 5.0,
                    children: Clarity.map((c) => clarname(c)).toList(),
                  ),
                ),
              ),
            ),
            Divider(
              color: Colors.purple,
              height: 10.0,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Lab Certificate',
                  style: TextStyle(
                      color: Colors.purple,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Wrap(
                    spacing: 5.0,
                    runSpacing: 5.0,
                    children: Labcert.map((l) => Lcert(l)).toList(),
                  ),
                ),
              ),
            ),
            Divider(
              color: Colors.purple,
              height: 10.0,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Size',
                  style: TextStyle(
                      color: Colors.purple,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Wrap(
                    spacing: 5.0,
                    runSpacing: 5.0,
                    children: _size.map((sz) => cutname(sz)).toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget shape(String b) {
    return FilterChip(
        checkmarkColor: Colors.white,
        selectedColor: Colors.purple[400],
        //avatar: Text(""),
        label: Text(b),
        selected: controller.selectedlist.contains(b),
        onSelected: (bool sele) {
          setState(() {
            if (sele)
              controller.selectedlist.add(b);
            else
              controller.selectedlist.remove(b);
          });
        });
  }

  Widget cname(String a) {
    return FilterChip(
        checkmarkColor: Colors.white,
        selectedColor: Colors.purple[400],
        //avatar: Text(""),
        label: Text(a),
        selected: colorname.selectedcolors.contains(a),
        onSelected: (bool sele) {
          setState(() {
            if (sele)
              colorname.selectedcolors.add(a);
            else
              colorname.selectedcolors.remove(a);
          });
        });
  }

  Widget clarname(String c) {
    return FilterChip(
        checkmarkColor: Colors.white,
        selectedColor: Colors.purple[400],
        //avatar: Text(""),
        label: Text(c),
        selected: claritynm.selectedclarity.contains(c),
        onSelected: (bool sele) {
          setState(() {
            if (sele)
              claritynm.selectedclarity.add(c);
            else
              claritynm.selectedclarity.remove(c);
          });
        });
  }

  Widget Lcert(String l) {
    return FilterChip(
        checkmarkColor: Colors.white,
        selectedColor: Colors.purple[400],
        //avatar: Text(""),
        label: Text(l),
        selected: certnm.selectedcert.contains(l),
        onSelected: (bool sele) {
          setState(() {
            if (sele)
              certnm.selectedcert.add(l);
            else
              certnm.selectedcert.remove(l);
          });
        });
  }

  Widget cutname(String sz) {
    return FilterChip(
        checkmarkColor: Colors.white,
        selectedColor: Colors.purple[400],
        //avatar: Text(""),
        label: Text(sz),
        selected: size.selectedsize.contains(sz),
        onSelected: (bool sele) {
          setState(() {
            if (sele)
              size.selectedsize.add(sz);
            else
              size.selectedsize.remove(sz);
          });
        });
  }
}
