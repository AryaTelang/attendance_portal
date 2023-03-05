import 'package:attendance_portal/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:email_validator/email_validator.dart';
import '';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String email = "",
      password = "";
  bool hidden = true;

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: SafeArea(
            child: Container(
              decoration: BoxDecoration(color: Color(0xFFEDE5D8)),
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: GestureDetector(
                  onTap: () {
                    FocusScopeNode currentFocus = FocusScope.of(context);

                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                  },
                  child: SingleChildScrollView(
                    child: Column(children: [
                      Center(
                        child: Column(

                          children: [
                            Image.asset('assets/Fb.png',
                                height: 200, width: 100),
                            Text(
                              "Food Buglars",
                              style: (GoogleFonts.getFont(
                                'Righteous',
                                fontSize: 30,
                                fontWeight: FontWeight.w900,
                              )),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 60,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  SizedBox(width: 40, height: 10),
                                  Text(
                                    "Welcome back.",
                                    style: TextStyle(
                                      fontSize: 45,
                                      fontWeight: FontWeight.w900,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(10.0)),
                      Container(
                        padding: EdgeInsets.only(left: 35.0, right: 35.0),
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(13),
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: "Email",
                                  hintStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey,
                                  ),
                                  errorStyle: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w500),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(7.0),
                                      borderSide: BorderSide.none)),
                              autovalidateMode: AutovalidateMode
                                  .onUserInteraction,
                              validator: (email) {
                                if (email != null &&
                                    !EmailValidator.validate(email)) {
                                  return 'Please enter a Valid Email';
                                }
                                return null;
                              },
                              controller: _emailController,
                              onSaved: (value) {
                                email = value!;
                              },
                            ),
                            Padding(padding: EdgeInsets.all(10.0)),
                            Column(
                              children: [
                                TextFormField(
                                  obscureText: hidden,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(10),
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: "Password",
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
                                        borderRadius: BorderRadius.circular(
                                            7.0),
                                        borderSide: BorderSide.none),
                                  ),
                                  autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter Password';
                                    } else if (value.length < 6) {
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
                                        color: Colors.black54,
                                        fontSize: 13.5,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
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
                                  height: 30,
                                  width: 100,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        Home();
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xFFEC4C47),
                                      foregroundColor: Colors.black,
                                    ),
                                    child: const Text("Log In"),
                                  )),
                            ),
                            SizedBox(
                              width: 20.0,
                              height: 20.0,
                            ),

                          ],
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            )
        )
    );
  }
}
