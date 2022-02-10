import 'package:http/http.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';


class newgmail extends StatefulWidget {
  var pdf;
   newgmail({ Key? key ,this.pdf }) : super(key: key);

  @override
  _newgmailState createState() => _newgmailState();
}

class _newgmailState extends State<newgmail> {
  @override
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Email send"),
      ),
      body: Center(
        // ignore: deprecated_member_use
        child: RaisedButton(
          onPressed: () {
            main();
          },
          child: Text("send"),
          ),
      ),
    );
  }
}
main() async {
  String username = 'parthaitchess@gmail.com';
  String password = '9665520590';

  // ignore: deprecated_member_use
  final smtpServer = gmail(username, password);
  // Create our message.
  final message = Message()
    ..from = Address(username)
    ..recipients.add('parthaitawade20@gmail.com')
    ..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com'])
    ..bccRecipients.add(Address('bccAddress@example.com'))
   ..subject = 'welcome to Diasoft Application:: 😀 ::' ;
   
 

  try {
    final sendReport = await send(message, smtpServer);
    print('Message sent: ' + sendReport.toString());
  } on MailerException catch (e) {
    print('Message not sent.');
    for (var p in e.problems) {
      print('Problem: ${p.code}: ${p.msg}');
    }
  }
}