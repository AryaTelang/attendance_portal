import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:email_validator/email_validator.dart';

import 'home.dart';

class Log extends StatefulWidget {
  const Log({Key? key}) : super(key: key);

  @override
  State<Log> createState() => _LogState();
}

class _LogState extends State<Log> {
  final TextEditingController _sapController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String sap = "", password = "";
  bool hidden = true;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                  "assets/images/lovepik-college-girl-library-study-picture_500587696.jpg"),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: SingleChildScrollView(
            child: Column(children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [BoxShadow(color: Colors.black,offset: Offset(2,2),blurRadius: 10,spreadRadius: 2)],
                    color: Colors.white),
                width: 330,
                height: 550,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Image.asset('assets/images/dj sanghvi logo.png',
                          height: 96, width: 105),
                      SizedBox(
                        height: 50,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15)),
                            Text(
                              "Welcome back.",
                              style: (GoogleFonts.getFont(
                                'Montserrat',
                                fontSize: 40,
                                fontWeight: FontWeight.w800,
                              )),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ),
                      Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                      Container(
                        padding: EdgeInsets.only(left: 27, right: 35.0),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5)),
                                  Text(
                                    "Sap id:",
                                    style: (GoogleFonts.getFont(
                                      'Montserrat',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                    )),
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(13),
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: "Enter Sap Id",
                                  hintStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey,
                                  ),
                                  errorStyle: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w500),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7.0),
                                    borderSide:
                                        BorderSide(color: Color(0xff848792)),
                                  )),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,

                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '*Enter Sap Id';
                                } else if (value.length < 11) {
                                  return "Sap Id has 11 digits";
                                }
                                return null;
                              },
                              controller: _sapController,
                              onSaved: (value) {
                                sap = value!;
                              },

                            ),
                            Padding(padding: EdgeInsets.all(10.0)),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  Padding(
                                      padding:
                                      EdgeInsets.symmetric(horizontal: 5)),
                                  Text(
                                    "Enter your password",
                                    style: (GoogleFonts.getFont(
                                      'Montserrat',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                    )),
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10,),
                            Column(
                              children: [
                                TextFormField(
                                  obscureText: hidden,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(10),
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: "*Enter your password",
                                    hintStyle: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey),
                                    errorStyle: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.w500),
                                    suffix: InkWell(
                                      onTap: () {
                                        setState(() {
                                          hidden = !hidden;
                                        });
                                      },
                                      child: Icon(
                                        !hidden
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        size: 20,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(7.0),
                                        borderSide:
                                            BorderSide(color: Color(0xff848792))),
                                  ),
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return '*Password not entered';
                                    } else if (value.length < 11) {
                                      return "Enter minimum six characters";
                                    }
                                    return null;
                                  },
                                  controller: _passwordController,
                                  onSaved: (value) {
                                    password = value!;
                                  },
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                GestureDetector(
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      "Forgot password?",
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Color(0xff0056D2),
                                        fontSize: 13.5,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => Home()));
                                  },
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 10.0,
                              height: 20.0,
                            ),
                            Center(
                              child: SizedBox(
                                  height: 55,
                                  width: 300,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        Home();
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xFF0056D2),
                                      foregroundColor: Colors.black,
                                    ),
                                    child:  Text("Sign In",style: (GoogleFonts.getFont('Inter',fontSize: 24,fontWeight: FontWeight.w700,color: Colors.white)),),
                                  )),
                            ),
                            SizedBox(
                              width: 20.0,
                              height: 20.0,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    ));
  }
}
