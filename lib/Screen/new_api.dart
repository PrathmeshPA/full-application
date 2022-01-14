import 'dart:convert';
import 'dart:math';



import 'package:dsapp/Screen/display_data.dart';

import 'package:dsapp/Screen/listcontroll.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
//import 'package:get/get.dart';

class SelectedDataProvider extends ChangeNotifier {}

class Newapi extends StatefulWidget {
  @override
  _apiState createState() => _apiState();
}

// ignore: camel_case_types
class _apiState extends State<Newapi> {
  var controller = Get.put(selectcontroll());
  var colorname = Get.put(selectcolor());
  var claritynm = Get.put(selectclarity());
  var certnm = Get.put(selectcertificate());
  var cut = Get.put(selectcut());
  var sizenm = Get.put(SelectSize());
  var polish = Get.put(selectpolish());
  var symmetry = Get.put(selectsymmetry());

  List product = [];
  List shape = [];
  List colornm = [];
  List clarity = [];
  List certname = [];
  List cutname = [];
  List polnmae = [];
  List symname = [];
  List size = [];
  List cname = [];
  List temp = [];

  var a;
  Future getdata() async {
    var rec =
        await http.get(Uri.parse("http://diasoft.in/neweasy/ajax/getcert.php"));
    if (rec.statusCode == 200)
      setState(() {
        product = jsonDecode(rec.body) as List;
      });
    controller.selectedlist.forEach((element) {
      String newdata = element;
      shape.addAll(product.where((u) => u.containsValue(newdata)));
    });

    if (controller.selectedlist.isEmpty) {
      shape = product;
    }
    colorname.selectedcolors.forEach((element) {
      String codata = element;
      colornm.addAll(shape.where((element) => element.containsValue(codata)));
    });

    if (colorname.selectedcolors.isEmpty) {
      colornm = shape;
    }

    claritynm.selectedclarity.forEach((element) {
      String clrdata = element;
      clarity
          .addAll(colornm.where((element) => element.containsValue(clrdata)));
    });

    if (claritynm.selectedclarity.isEmpty) {
      clarity = colornm;
    }

    certnm.selectedcert.forEach((element) {
      String clrdata = element;
      certname
          .addAll(clarity.where((element) => element.containsValue(clrdata)));
    });

    if (certnm.selectedcert.isEmpty) {
      certname = clarity;
    }

    cut.selectedcut.forEach((element) {
      String clrdata = element;
      cutname
          .addAll(certname.where((element) => element.containsValue(clrdata)));
    });

    if (cut.selectedcut.isEmpty) {
      cutname = certname;
    }

    polish.selectedpol.forEach((element) {
      String clrdata = element;
      polnmae
          .addAll(cutname.where((element) => element.containsValue(clrdata)));
    });

    if (polish.selectedpol.isEmpty) {
      polnmae = cutname;
    }

    symmetry.selectedsymm.forEach((element) {
      String clrdata = element;
      symname
          .addAll(polnmae.where((element) => element.containsValue(clrdata)));
    });

    if (symmetry.selectedsymm.isEmpty) {
      symname = polnmae;
    }

    sizenm.selectedsize.forEach((element) {
      String sizedata = element;
      size.addAll(symname.where((element) => element.containsValue(sizedata)));
    });

    if (sizenm.selectedsize.isEmpty) {
      size = symname;
    }

    cname = size;
  }

  @override
  void initState() {
    super.initState();
    getdata();
  }

  List post = [];
  List _addSelectedValueArr = [];
  List _addSalePrice = [];

  getCheckboxItems() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DisplayData(
                  newdata: _addSelectedValueArr,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          // title: Text("ApiData"),
          actions: [
            TextButton.icon(
              onPressed: getCheckboxItems, 
              icon: Icon(Icons.shopping_cart_rounded, color: Colors.white,), label: Text('Add To Cart', style: TextStyle(color: Colors.white),))
            // IconButton(
            //     onPressed: getCheckboxItems,
                
            //     tooltip: 'Add To Cart',
            //     icon: Icon(Icons.shopping_cart_rounded))
          ],
        ),
        body: ListView.builder(
            itemCount: cname.length,
            itemBuilder: (context, index) {
              final post = cname[index];

              return Card(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10, top: 10),
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 1.0),
                        horizontalTitleGap: 1.0,
                        leading: Checkbox(
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            value: post['checked'] ?? false,
                            onChanged: (value) {
                              setState(() {
                                post['checked'] = value;
                              });
                              print("onChanged: (value):$value ");
                              if (value == true) {
                                _addSelectedValueArr.add(cname[index]);
                                _addSalePrice.add(cname[index]['saleprice']);

                                print(_addSalePrice);

                                // print(_addSelectedValueArr);
                              } else if (value == false) {
                                _addSelectedValueArr.remove(cname[index]);
                              }
                            }),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  cname[index]['name'].toString(),
                                  style: TextStyle(fontSize: 12.0),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  cname[index]['shapenm'].toString(),
                                  style: TextStyle(fontSize: 12.0),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  cname[index]['colornm'].toString(),
                                  style: TextStyle(fontSize: 12.0),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  cname[index]['clarnm'].toString(),
                                  style: TextStyle(fontSize: 12.0),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  cname[index]['clqty'].toString(),
                                  style: TextStyle(fontSize: 12.0),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  cname[index]['cert'].toString(),
                                  style: TextStyle(fontSize: 12.0),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  '-' + cname[index]['disc'].toString() + '%',
                                  style: TextStyle(fontSize: 12.0),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  '\$' + cname[index]['saleprice'].toString(),
                                  style: TextStyle(fontSize: 12.0),
                                ),
                              ],
                            ),
                            SizedBox(height: 12.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  cname[index]['dmin'].toString() +
                                      ' ' +
                                      'x' +
                                      ' ' +
                                      cname[index]['dmax'].toString() +
                                      ' ' +
                                      'x' +
                                      ' ' +
                                      cname[index]['height'].toString(),
                                  style: TextStyle(fontSize: 12.0),
                                ),
                                Text(
                                  cname[index]['cut'].toString() +
                                      ' ' +
                                      '-' +
                                      ' ' +
                                      cname[index]['pol'].toString() +
                                      ' ' +
                                      '-' +
                                      ' ' +
                                      cname[index]['sym'].toString(),
                                  style: TextStyle(fontSize: 12.0),
                                ),
                                Text(
                                  'D:' + cname[index]['depth'].toString() + '%',
                                  style: TextStyle(fontSize: 12.0),
                                ),
                                Text(
                                  'T:' +
                                      cname[index]['tableper'].toString() +
                                      '%',
                                  style: TextStyle(fontSize: 12.0),
                                ),
                                Text(
                                  'FL:' + cname[index]['flour'].toString(),
                                  style: TextStyle(fontSize: 12.0),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}
