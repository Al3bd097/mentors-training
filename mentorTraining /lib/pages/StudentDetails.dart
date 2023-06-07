import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mentor/models/Students.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class StudentDetails extends StatelessWidget {
  StudentDetails({Key? key, required this.studentt}) : super(key: key);
  final Students studentt;

  TextEditingController _gradeController = TextEditingController();
  TextEditingController _subjectController = TextEditingController();
  TextEditingController _textController = TextEditingController();

  ///
  /// Mail package
  ///
  Future<void> sendMail() async {
    try {
      var userEmail = "willmax097@gmail.com";
      var message = Message();
      message.subject = _subjectController.text;
      message.text = _textController.text;
      message.from = Address(userEmail.toString());
      message.recipients.add(studentt.mail);
      var smtpServer = gmail("willmax097@gmail.com", "cztphrwzackkpipv");
      send(message, smtpServer);
      print("Email has been sent successfully");
    } catch (e) {
      print("${e.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(studentt.name),
        backgroundColor: Color(0xff09051A),
      ),
      body: Container(
        decoration: BoxDecoration(color: Color(0xff09051A)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              "assets/images/Speaker_Photo-Frame-Anonymous.png",
              width: 250,
              height: 250,
            ),
            Text(
              studentt.name,
              style: TextStyle(fontSize: 30, color: Color(0xff4E32DD)),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.cookie),
                      Text(
                        "Snack: ${studentt.snack}",
                        style: TextStyle(fontSize: 25, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.cookie),
                    Text(
                      "Impression: ${studentt.impression}",
                      style: TextStyle(fontSize: 25, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),

            ///
            /// Grade Project
            ///
            Container(
              margin: EdgeInsets.all(20),
              child: Row(
                children: [
                  Text(
                    "Grade Project: ",
                    style: TextStyle(fontSize: 25, color: Colors.grey),
                  ),
                  Container(
                    width: 170,
                    margin: EdgeInsets.only(left: 20, right: 0, bottom: 15),
                    child: TextField(
                      controller: _gradeController,
                      // style: TextStyle(color: Color(0xff4E32DD)),
                      style: TextStyle(color: Colors.grey),
                      decoration: InputDecoration(
                          labelText: "Grade",
                          labelStyle: TextStyle(color: Colors.grey),
                          prefixIcon: Icon(
                            Icons.edit,
                            color: Colors.grey,
                          ),
                          suffixIcon: _gradeController.text.isEmpty
                              ? Container(width: 0)
                              : IconButton(
                                  onPressed: () => _gradeController.clear(),
                                  icon: Icon(Icons.close)),
                          hintText: "Enter your Email",
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white.withOpacity(0.8),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(15)),
                          focusedBorder: OutlineInputBorder(
                              // borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(
                                  color: Color(0xff4E32DD), width: 2))),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                ///
                /// Subject
                ///
                Container(
                  width: 170,
                  margin: EdgeInsets.only(left: 20, right: 10, bottom: 15),
                  child: TextField(
                    controller: _subjectController,
                    // style: TextStyle(color: Color(0xff4E32DD)),
                    style: TextStyle(color: Colors.grey),
                    decoration: InputDecoration(
                        labelText: "Subject",
                        labelStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(
                          Icons.mail,
                          color: Colors.grey,
                        ),
                        suffixIcon: _subjectController.text.isEmpty
                            ? Container(width: 0)
                            : IconButton(
                                onPressed: () => _subjectController.clear(),
                                icon: Icon(Icons.close)),
                        hintText: "Enter your Email",
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white.withOpacity(0.8),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(15)),
                        focusedBorder: OutlineInputBorder(
                            // borderRadius: BorderRadius.circular(40),
                            borderSide: BorderSide(
                                color: Color(0xff4E32DD), width: 2))),
                  ),
                ),

                ///
                /// Text
                ///
                Container(
                  width: 170,
                  margin: EdgeInsets.only(left: 20, right: 40, bottom: 15),
                  child: TextField(
                    controller: _textController,
                    // style: TextStyle(color: Color(0xff4E32DD)),
                    style: TextStyle(color: Colors.grey),
                    decoration: InputDecoration(
                        labelText: "Text",
                        labelStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(
                          Icons.edit,
                          color: Colors.grey,
                        ),
                        suffixIcon: _textController.text.isEmpty
                            ? Container(width: 0)
                            : IconButton(
                                onPressed: () => _textController.clear(),
                                icon: Icon(Icons.close)),
                        hintText: "Enter your Email",
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white.withOpacity(0.8),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(15)),
                        focusedBorder: OutlineInputBorder(
                            // borderRadius: BorderRadius.circular(40),
                            borderSide: BorderSide(
                                color: Color(0xff4E32DD), width: 2))),
                  ),
                ),
              ],
            ),

            ///
            /// Send Mail
            ///
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.mail,
                  size: 50,
                  color: Colors.grey,
                ),
                MaterialButton(
                  color: Color(0xff4E32DD),
                  child: Text(
                    "Send mail",
                    style: TextStyle(fontSize: 30, color: Colors.grey),
                  ),
                  onPressed: sendMail,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
