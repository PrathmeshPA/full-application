import 'package:dsapp/Screen/new_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'listcontroll.dart';

List<dynamic> shname = ["CUSHION","PEAR","OVAL","ROUND","PRINCESS","HEART", "RADIANT","EMERALD","ASSCHER","MARQUISE",];

List<dynamic> colname = ["D","E","F","G","H","I","J","K","L","M","N"];

List<dynamic> Clarity=[ "IF","VVS1","VVS2","VS1","VS2","SI1","SI2","SI3", "I1", "I2", "I3"];

List<dynamic> Labcert = ["GIA" , "IGI" ,"GSI"];

List<dynamic> _cut = ["EX", "VG","GD","F"];

List<dynamic> _pol = ["EX", "VG","GD","F"];

List<dynamic> _sym = ["EX", "VG","GD","F"];

class FilterChipDisplay extends StatefulWidget {

   var filterchipemail ;
  FilterChipDisplay({Key ? mykye,  this.filterchipemail}) : super(key: mykye);
  // late final filterv filterveg;
  @override
  _FilterChipDisplayState createState() => _FilterChipDisplayState();
}

class _FilterChipDisplayState extends State<FilterChipDisplay> {


  
  TextEditingController fromController = TextEditingController();
  TextEditingController tocontroller = TextEditingController();
  var controller = Get.put(selectcontroll()); 
  var colorname =Get.put(selectcolor());  
  var claritynm = Get.put(selectclarity()); 
  var certnm =Get.put(selectcertificate()); 
  


  List ondataa = [];

    var datatab;

// late String chooseval;
  @override
  void initState() {
    
    super.initState();
    // fdata();
    // print(main());
    print(widget.filterchipemail);
   
  }

  @override
  Widget build(BuildContext context) {
   
    return new Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {}),
        title: Text(
          "Filter Result",
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
                // var fildata = await http
                //     .get(Uri.parse("http://192.168.29.222/neweasy/test.json"));

                // final fdata = jsonDecode(fildata.body) as List<dynamic>;

                // controller.selectedlist.forEach((elemen) {
                //   String filter = elemen;
                //   ondataa = fdata
                //       .where((element) => element.containsValue(filter))
                //       .toList();
                //   print(ondataa);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>api(sizefrom: fromController.text, sizeto: tocontroller.text, apigmail: widget.filterchipemail, )));
                //   // );
                // });
              }),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[

             // Text('${widget.Gmail}'),
            // FutureBuilder(
            //   future: FlutterSession().get('token'),
            //   builder: (context,index){
            //   return Text(index.hasData  ? index.data:datatab  );
            // }),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Shapes",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
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
              color: Colors.blueGrey,
              height: 10.0,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Colors',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
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
                  children: 
                    colname.map((a) => cname(a)).toList(),
                  ),
                ),
              ),
            ),

             Divider(
              color: Colors.blueGrey,
              height: 10.0,
            ),
             Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Clarity',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
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
                  children: 
                    Clarity.map((c) => clarname(c)).toList(),
                  ),
                ),
              ),
            ),
            
            Divider(
              color: Colors.blueGrey,
              height: 10.0,
            ),
      
             Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Certificate',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
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
                  children: 
                    Labcert.map((l) => Lcert(l)).toList(),
                  ),
                ),
              ),
            ),
      
             Divider(
              color: Colors.blueGrey,
              height: 10.0,
            ),

            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Size',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                
              ),
            ),
            

            Column(
              mainAxisAlignment : MainAxisAlignment.center,
              children: [
                
                 Row(
                    children: [
                      SizedBox(width: 8,),
                      Expanded(
                        child: from(),
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Expanded(
                          child: to()),
                    ],
                  ),
              ],
            )
        
          ],
          
        ),
      ), 
    );
  }
 
  Widget from(){
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField( 
                      
              controller: fromController,
              keyboardType: TextInputType.number,
              // validator: (v) =>num,
              decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(5),   
                labelText: "From",
                border: OutlineInputBorder(),   
                
                )          
              ),           
            
    );
  }

  Widget to() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
              
              controller: tocontroller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                contentPadding:  const EdgeInsets.all(5),
                labelText: "To",
                border: OutlineInputBorder()
              ),
            ),
    );
  }



  Widget shape(String b) {
    return FilterChip(
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
        //avatar: Text(""),
        label: Text(l),
        selected:certnm.selectedcert.contains(l),
        onSelected: (bool sele) {
          setState(() {
            if (sele)
              certnm.selectedcert.add(l);
            else
              certnm.selectedcert.remove(l);
          });
        });
  }

  
  }

