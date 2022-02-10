
import 'package:dsapp/gmail.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'mobile.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/rendering.dart';
// import 'package:pdf/pdf.dart';

class DisplayData extends StatefulWidget {
  List newdata = [] ;
  var usergmail;
  // List saledata = [];

  // SelectedData({required this.newdata});
  DisplayData({
    Key? key,
    required this.newdata,this.usergmail
  }) : super(key: key);

  @override
  _SelectedDataState createState() => _SelectedDataState();
}

class _SelectedDataState extends State<DisplayData> {
  set html(html) {}

  // var ndata = widget.newdata;

  

  List post = [];
  late dynamic dataon;
  var alldata;
  double mul = 0;
  double weight = 0;
  double weightSum = 0;
  double sum = 0;
  double amountSum = 0;
  double amount = 0;

  double pdfmul = 0;
  double pdfsum = 0;
  double pdfamount = 0;

  double amo=0;

   dynamic tabledata="";
    List clqt =[];
     
   
  
      
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cart"),
        ),
        // drawer: Drawer() ,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              DataTable2(
                  // horizontalMargin: 3.0,
                  columnSpacing: 10.0,
                  minWidth: 600.0,
                  columns: [
                    DataColumn2(
                        label: Text("Name"), size: ColumnSize.S, numeric: true),
                    DataColumn2(
                        label: Text("Shape"),
                        size: ColumnSize.L,
                        numeric: true),
                    DataColumn2(
                        label: Text("Color"),
                        size: ColumnSize.S,
                        numeric: true),
                    DataColumn2(
                        label: Text("Clarity"),
                        size: ColumnSize.S,
                        numeric: true),
                    DataColumn2(
                        label: Text("Weight"),
                        size: ColumnSize.S,
                        numeric: true),
                    DataColumn2(
                        label: Text("Discount"),
                        size: ColumnSize.M,
                        numeric: true),
                    DataColumn2(
                        label: Text("Price"),
                        size: ColumnSize.M,
                        numeric: true),
                    DataColumn2(
                        label: Text("Amount"),
                        size: ColumnSize.M,
                        numeric: true),
                  ],
                  rows: widget.newdata.map((e) {
                    weight += (e['clqty']);

                    mul =
                        (e['saleprice']) * (e['clqty']);
                    sum += mul;

                    weightSum = double.parse((weight).toStringAsFixed(2));

                    amount = double.parse((mul).toStringAsFixed(2));

                    amountSum = double.parse((sum).toStringAsFixed(2));

                    return DataRow2(cells: [
                      DataCell(Text(e["name"].toString())),
                      DataCell(Text(e["shapenm"].toString())),
                      DataCell(Text(e["colornm"].toString())),
                      DataCell(Text(e["clarnm"].toString())),
                      DataCell(Text(e["clqty"].toString())),
                      DataCell(Text('${e["disc"]}%'.toString())),
                      DataCell(Text('\$${e["saleprice"]}'.toString())),
                      DataCell(Text("\$$amount")),
                    ]);
                  }).toList()),
              Divider(
                color: Colors.purple[400],
                thickness: 8,
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Total Weight in Carat is : $weightSum"),
                  ],
                ),
              ),
              Divider(color: Colors.purple),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Total Amount To be paid is : \$$amountSum"),
                  ],
                ),
              ),
              Divider(color: Colors.purple),
              SizedBox(height: 20),
              Container(
                child: ElevatedButton(
                    onPressed: _createPDF, child: Text("Submit"),
                    ),
              ),
              // Container(
              //   child:  ListView.builder(
              //     itemCount: dataon.length,
              //     itemBuilder:( context, index){
              //       return Text(dataon[index]['name']);
              //     }),
              // ),
              ElevatedButton(onPressed: maingmail,
              child: Text("Send Gmail"),)
            ],
          ),
          
        ));
  }
     

   _createPDF() async {
    final document = PdfDocument();
    final page = document.pages.add();
    // clqt+=(tabledata);
    // newMap = groupBy(partySnapData, (obj) => obj['party_name']);
    

    PdfGrid grid = PdfGrid();

    grid.style = PdfGridStyle(
        font: PdfStandardFont(PdfFontFamily.helvetica, 10),
        cellPadding: PdfPaddings(left: 5, bottom: 5, right: 5, top: 5));
    grid.columns.add(count: 8);
    grid.headers.add(1);

    PdfGridRow header = grid.headers[0];

    header.style.backgroundBrush = PdfSolidBrush(PdfColor(68, 114, 196));

    // header.style.backgroundBrush = PdfSolidBrush(PdfColor(0,0,255));
    header.style.font = PdfStandardFont(PdfFontFamily.timesRoman, 13);

    header.cells[0].stringFormat = PdfStringFormat(
      alignment: PdfTextAlignment.center,
      lineAlignment: PdfVerticalAlignment.middle,
    );
    header.cells[1].stringFormat = PdfStringFormat(
      alignment: PdfTextAlignment.center,
      lineAlignment: PdfVerticalAlignment.middle,
    );
    header.cells[2].stringFormat = PdfStringFormat(
      alignment: PdfTextAlignment.center,
      lineAlignment: PdfVerticalAlignment.middle,
    );
    header.cells[3].stringFormat = PdfStringFormat(
      alignment: PdfTextAlignment.center,
      lineAlignment: PdfVerticalAlignment.middle,
    );
    header.cells[4].stringFormat = PdfStringFormat(
      alignment: PdfTextAlignment.center,
      lineAlignment: PdfVerticalAlignment.middle,
    );
    header.cells[5].stringFormat = PdfStringFormat(
      alignment: PdfTextAlignment.center,
      lineAlignment: PdfVerticalAlignment.middle,
    );
    header.cells[6].stringFormat = PdfStringFormat(
      alignment: PdfTextAlignment.center,
      lineAlignment: PdfVerticalAlignment.middle,
    );
    header.cells[7].stringFormat = PdfStringFormat(
      alignment: PdfTextAlignment.center,
      lineAlignment: PdfVerticalAlignment.middle,
    );

    header.cells[0].value = 'Name';
    header.cells[1].value = 'Shape';
    header.cells[2].value = 'Color';
    header.cells[3].value = 'Clarity';
    header.cells[4].value = 'Weight';
    header.cells[5].value = 'Discount';
    header.cells[6].value = 'Price';
    header.cells[7].value = 'Amount';

    widget.newdata.map((e) {
      // print(mul);
      pdfmul = (e['saleprice']) * (e['clqty']);
      pdfsum += pdfmul;
      
      pdfamount = double.parse((pdfmul).toStringAsFixed(2));

     

      PdfGridRow row = grid.rows.add();

      row.cells[0].stringFormat = PdfStringFormat(
          alignment: PdfTextAlignment.center,
          lineAlignment: PdfVerticalAlignment.middle);
      row.cells[1].stringFormat = PdfStringFormat(
          alignment: PdfTextAlignment.center,
          lineAlignment: PdfVerticalAlignment.middle);
      row.cells[2].stringFormat = PdfStringFormat(
          alignment: PdfTextAlignment.center,
          lineAlignment: PdfVerticalAlignment.middle);
      row.cells[3].stringFormat = PdfStringFormat(
          alignment: PdfTextAlignment.center,
          lineAlignment: PdfVerticalAlignment.middle);
      row.cells[4].stringFormat = PdfStringFormat(
          alignment: PdfTextAlignment.center,
          lineAlignment: PdfVerticalAlignment.middle);
      row.cells[5].stringFormat = PdfStringFormat(
          alignment: PdfTextAlignment.center,
          lineAlignment: PdfVerticalAlignment.middle);
      row.cells[6].stringFormat = PdfStringFormat(
          alignment: PdfTextAlignment.right,
          lineAlignment: PdfVerticalAlignment.middle);
      row.cells[7].stringFormat = PdfStringFormat(
          alignment: PdfTextAlignment.right,
          lineAlignment: PdfVerticalAlignment.middle);
        // name =(e['name']).toString();
      row.cells[0].value = (e['name']).toString();
      row.cells[1].value = (e['shapenm']).toString();
      row.cells[2].value = (e['colornm']).toString();
      row.cells[3].value = (e['clarnm']).toString();
      row.cells[4].value = (e['clqty']).toString();
      row.cells[5].value = ('${e['disc']}%' ).toString();
      row.cells[6].value = ( '\$${e['saleprice']}').toString();
      row.cells[7].value = ('\$$pdfamount').toString();
    }).toList();

    PdfLayoutFormat layoutFormat =
        PdfLayoutFormat(layoutType: PdfLayoutType.paginate);

    PdfLayoutResult gridResult = grid.draw(
        bounds: Rect.fromLTWH(0, 20, 0, 0), page: page, format: layoutFormat)!;

    gridResult.page.graphics.drawLine(
        PdfPen(PdfColor(68, 114, 196), width: 2.0),
        Offset(0, gridResult.bounds.bottom + 15),
        Offset(515, gridResult.bounds.bottom + 15));

    gridResult.page.graphics.drawString('Total Weight in Carat: $weightSum',
        PdfStandardFont(PdfFontFamily.helvetica, 12),
        brush: PdfBrushes.black,
        bounds: Rect.fromLTWH(0, gridResult.bounds.bottom + 25, 0, 0));

    gridResult.page.graphics.drawString('Total Amount To Be Paid: \$$amountSum',
        PdfStandardFont(PdfFontFamily.helvetica, 12),
        brush: PdfBrushes.black,
        bounds: Rect.fromLTWH(0, gridResult.bounds.bottom + 45, 0, 0));

    gridResult.page.graphics.drawLine(
        PdfPen(PdfColor(68, 114, 196), width: 2.0),
        Offset(0, gridResult.bounds.bottom + 70),
        Offset(515, gridResult.bounds.bottom + 70));

    gridResult.page.graphics.drawString(
      'THANK YOU !!!', 
      PdfStandardFont(PdfFontFamily.helvetica, 18),
      brush: PdfBrushes.blue,
      bounds: Rect.fromLTWH(gridResult.bounds.left + 200, gridResult.bounds.bottom + 80, 0, 0)
    );

    //  final page = document.pages.add();

    dynamic bytes = document.save();
    document.dispose();

    saveAndLaunchfile(bytes, 'Summary.pdf');
    // new GestureDetector(onTap: maingmail,);
    
  }
  newfunc() {
  tabledata+=  widget.newdata.map((ele) => ("<tr><td>" + ele['name'].toString()  + "</td>" 
    + "<td>" + ele['shapenm'].toString()  + "</td>" + 
    "<td>"   + ele['colornm'].toString()    + "</td>" + 
    "<td>"   + ele['clarnm'].toString()    + "</td>" + 
    "<td>"   + ele['clqty'].toString()    + "</td>" +
     "<td>" + '${ele['disc']}%'.toString()    + "</td>" + 
     "<td>" + '\$${ele['saleprice']}'.toString()    +  "</td>"+
     "<td>" + '\$${ele['saleprice'] * ele['clqty']}'.toString()  +
    //  "<td>" + '\$${ele['saleprice'] * ele['clqty']}'.toString()  +
     "</td></tr>")).toString();

   

  }
  
   
    Future maingmail() async {
  
  String username = 'patilram2022@gmail.com';
  String password = '9970878210';

  // ignore: deprecated_member_use
  final smtpServer = gmail(username, password);
  // Create our message.
  final message = Message()
    ..from = Address(username)
    // ..recipients.add('info@diasoft.in')
    ..recipients.add('parthaitawade20@gmail.com')
    ..ccRecipients.addAll([widget.usergmail])
    // ..bccRecipients.add(Address('bccAddress@example.com'))
   ..subject = 'welcome to Diasoft Application:: 😀 ::'
   ..text = 'This is the plain text.\nThis is line 2 of the text part.'



    ..html =  
       '''
   <html>
   <body>
  
   <h2>This is the Selected Diomand</h2>

   <table algn ="center" border = "1px" style="width:300px; line-height:30px;">
  <thead>
   <tr>
     <th> Name     </th>
     <th> Shape    </th>
     <th> Color    </th>
     <th> Certificate    </th>
     <th> Weight   </th>
     <th> Discount </th>
     <th> Price    </th>
     <th> Amount    </th>
  </tr>
  </thead>
  
     
     <tbody>
       $tabledata                             

      </tbody>
    
       
        

 </table>
 
  
       
  </body>
  </html>

    '''; 
   
 
   try {
    final sendReport = await send(message, smtpServer);
     Fluttertoast.showToast(msg: "Gmail Massage Send");
    print('Message sent: ' + sendReport.toString());
  } on MailerException catch (e) {
    Fluttertoast.showToast(msg: "Gmail Massage not Send");
    print('Message not sent.');
    for (var p in e.problems) {
      
      print('Problem: ${p.code}: ${p.msg}');
    }
  }
    }
}

// ${widget.newdata.map((e) => {

//       '<td>' , e['name'], '</td>' 
//       '<td>' , e['shapenm'], '</td>'
//       '<td>' , e['colornm'], '</td>'
//       '<td>' , e['clarnm'], '</td>'
//       '<td>' , e['clqty'], '</td>'
     
//       })}



 
    //   <tr>
    //  <td>   ${widget.newdata.map((e) =>  e['name'])} </td>    
    //   <td>  ${widget.newdata.map((e) => e['shapenm'])}   </td>   
    //   <td>  ${widget.newdata.map((e) => e['colornm'])}   </td>    
    //   <td>  ${widget.newdata.map((e) => e['clarnm'])}    </td>  
    //   <td>  ${widget.newdata.map((e) => e['clqty'])}     </td>   
    //   <td>  ${widget.newdata.map((e) => e['disc'])}      </td>  
    //   <td>  ${widget.newdata.map((e) => e['saleprice'])} </td> 
    //   <td>  ${pdfamount}                                 </td> 
    //   </tr> 

    // <td>${widget.newdata.map((e) => {
    //        e['name'],
    //      })}</td>
    //       <td>${widget.newdata.map((e) => {
    //        e['shapenm'],
    //      })}</td>
    //       <td>${widget.newdata.map((e) => {
    //        e['colornm'],
    //      })}</td>
    //       <td>${widget.newdata.map((e) => {
    //        e['clarnm'],
    //      })}</td>


   