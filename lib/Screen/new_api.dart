import 'dart:convert';
import 'package:dsapp/Screen/display_data.dart';
import 'package:matcher/matcher.dart';

import 'package:get/get_navigation/src/root/parse_route.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_widget_cache.dart';
import 'package:http/http.dart' as http;
import 'listcontroll.dart';


class api extends StatefulWidget {
  var apigmail;
  var sizefrom ;
  var sizeto;
  // String sizefor= sfrom.toString();
  api({Key ? key , this.sizefrom, this.sizeto, this.apigmail}) : super(key: key);
  @override
  _apiState createState() => _apiState();
}

// ignore: camel_case_types
  class _apiState extends State<api> {
  var controller =Get.put(selectcontroll());
  var colorname  =Get.put(selectcolor());
  var claritynm  =Get.put(selectclarity());
  var certnm     =Get.put(selectcertificate());
 
  List product = [];
  List shape =   [];
  List colornm = [];
  List clarity = [];
  List certname= [];
  List cutname = [];
  List polnmae = [];
  List symname = [];
  List cname=[] ;
 List sizef=[] ;
  List sto=[];
  var alldata ; 

@override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    print(widget.apigmail);
  }
//  var clqty ;
  // List newe=[];
  var newe ;
  var oldd;
  // List<dynamic> newe=[];
  Future getdata() async {
    var rec =
        await http.get(Uri.parse("http://diasoft.in/neweasy/ajax/getcert.php"));
    if (rec.statusCode == 200)
      setState(() {
        product = jsonDecode(rec.body) as List;
      });
    
    
    controller.selectedlist.forEach((element) {
     String newdata = element;
      // d.addAll(product.where((element) => element.containsValue(newdata)));
      shape.addAll(product.where((u) => u.containsValue(newdata)));
      // alldata=colornm;
    });

     
        var abc = 'clqty';
      sto.addAll(product.where((element) => element.containsValue(abc)));
      // newe=double.parse(sto.toString());
    
      if(controller.selectedlist.isEmpty){
        shape = product;
      }
      //product.sort((a ,b) =>a.compareTo(b));
      colorname.selectedcolors.forEach((element) {
        String codata = element;
        colornm.addAll(shape.where((element) => element.containsValue(codata)));
      });

        if(colorname.selectedcolors.isEmpty){
        colornm = shape;
      }

      claritynm.selectedclarity.forEach((element) {
        String clrdata=element;
        clarity.addAll(colornm.where((element) => element.containsValue(clrdata) ));
      });

        if(claritynm.selectedclarity.isEmpty){
        clarity = colornm;
       }
      
      certnm.selectedcert.forEach((element){
        String clrdata=element;
        certname.addAll(clarity.where((element) => element.containsValue(clrdata)));
      });

      if(certnm.selectedcert.isEmpty){
        certname = clarity;
       }
    ///////////////////////////////////////////////////////
       if(widget.sizefrom.isEmpty){
         widget.sizefrom =null;
        //  return null;
       }else{
         newe=double.parse(widget.sizefrom);  
        sizef.addAll(certname.where((element) => element['clqty'] >= newe));
       }

              if(newe==null){
               sizef =certname;
              }



        if(widget.sizeto.isEmpty){
          widget.sizeto =null;
          // return null;
          
          }else{

          oldd =double.parse(widget.sizeto);
          sto.addAll(sizef.where((element)=>element['clqty'] <=oldd)); 
          }
              if(oldd==null){
                  sto=certname;
            }
          // sto = certname;
//////////////////////////////////////////////////////////////////////////////////
       
          // if(newe == null){
          //      newe = 0;
          // }else{
        // newe=double.parse(widget.sizefrom.text);  
        // sizef.addAll(certname.where((element) => element['clqty'] >= newe));
        // if(widget.sizefrom.text.isEmpty){
        //   sizef =certname;
        // }
      //  }
  
      // sizef.addAll(certname.where((element)=> element.containsValue(element > 1.5)));
        // sizef.addAll(certname.where((element) => element['clqty'] >= newe));

      //  if(widget.sizefrom.text.isEmpty){
      //     sto=certname;
      //       }

          // if(widget.sizeto.text.isEmpty){
          //   return  
          // }
      // oldd =double.parse(widget.sizeto.text);
      // sto.addAll(sizef.where((element)=>element['clqty'] <=oldd));  

      // if(widget.sizeto.text.isEmpty){
      //   sto =sizef;
      // }
      // if(newe.isEmpty || oldd.isEmpty){
      //     newe = 0;
      //     oldd = 0;
      // }


        
        cname=sto;


        // if(cname.isEmpty){
        //    Fluttertoast.showToast(
        // msg: "Wrong password",
        // toastLength: Toast.LENGTH_SHORT,
        // gravity: ToastGravity.CENTER,
        // timeInSecForIosWeb: 4,
        // );
        // }
        // print(cname);
        // print(sizefrome);
        //print(product);
        print(cname);
        // List ner= (cname["clqty"]);
  }

  @override
  void initState() {
    super.initState();
    getdata();
    // print(product);
    
    // print(d);
    // print(sto);
  }
 
  //ode = false;
 List post = [];

  getCheckboxItems() {
    cname.forEach((post) {
      if (post['checked'] == true) {
        // print(_addSelectedValueArr);
        Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>DisplayData(newdata: _addSelectedValueArr , usergmail: widget.apigmail,)/*(finalgmail:  widget.apigmail, newdata: _addSelectedValueArr)*/
                      /*(finalgmail: widget.apigmail, data: _addSelectedValueArr,)*/));
        // var selected = post;
      }
    });
  }
  
  var _isSelectedCheckBoxArr = List<dynamic>.empty(growable: false).obs;
  var _addSelectedValueArr =List<dynamic>.empty(growable: false).obs;
  // var  post;
  List newdt = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: Text("ApiData"),
          actions: [
            IconButton(
                onPressed: getCheckboxItems,
                // onPressed: () {
                //   Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => SelectedData(
                //                 newdata: post,
                //               )
                //               )
                //               );
                // },
                icon: Icon(Icons.add_shopping_cart_rounded))
          ],
        ),
        body: ListView.builder(
            itemCount:  cname.length,
            itemBuilder: (context, index) {
              final post = cname[index];
              // _addSelectedValueArr.addAll(cname);
              // post.forEach((element) {
              //   String sh =element;
              //   newdt.addAll(_addSelectedValueArr);
              // });
              return Card(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Checkbox(
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              value: post['checked'] ?? false,
                              // value: _isSelectedCheckBoxArr[index],
                              onChanged: (value) {
                                setState(() {
                                 
                                  post['checked'] = value;
                                });

                                print("onChanged: (value):$value ");

                                if (value == true) {
                                  setState(() {
                                    _addSelectedValueArr.add(cname[index]);
                                  });
                                } else if (value == false) {
                                  setState(() {
                                    _addSelectedValueArr.remove(cname[index]);
                                  });
                                }
                              })
                        ],
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                
                                Text(cname[index]['name'].toString()),

                                SizedBox(width: 5),
                                Text(cname[index]['shapenm'].toString()),
                                //Text(d[index]['shapenm'].toString()),
                                SizedBox(width: 5),
                                Text(cname[index]['colornm'].toString()),
                                //Text(d[index]['colornm'].toString()),
                                SizedBox(width: 5),
                                Text(cname[index]['clarnm'].toString()),
                                SizedBox(width: 5),
                                Text(
                                  cname[index]['clqty'].toString(),
                                ),
                                SizedBox(width: 5),
                                Text(cname[index]['cert'].toString()),
                                SizedBox(width: 5),
                                Text('-' +
                                    cname[index]['disc'].toString() +
                                    '%'),
                                SizedBox(width: 5),
                                Text('\$' +
                                    cname[index]['saleprice'].toString()),
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
                                ),
                                Text('D:' +
                                    cname[index]['depth'].toString() +
                                    '%'),
                                Text('T:' +
                                    cname[index]['tableper'].toString() +
                                    '%'),
                                Text('FL:' + cname[index]['flour'].toString()),
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
