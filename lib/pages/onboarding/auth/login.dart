import 'package:evote/component/inputs/app_password_input.dart';
import 'package:evote/component/inputs/app_sized_box.dart';
import 'package:evote/component/inputs/app_text_field.dart';
import 'package:evote/component/others/modals.dart';
import 'package:evote/inventory_icon_icons.dart';
import 'package:evote/pages/dashboard/home.dart';
import 'package:evote/pages/onboarding/auth/signup.dart';
import 'package:evote/utils/validators.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final GlobalKey<FormState> _key = GlobalKey();
  final TextEditingController email = TextEditingController();
  final TextEditingController pwd = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                EvoteSizedBox(
                  height: 15,
                ),
                Center(
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Color(
                        0xff008751,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                EvoteTextField(
                  hintText: "Email Address",
                  controller: email,
                  prefixIcon: Icon(
                    InventoryIcon.unie99b,
                  ),
                  validator: EvoteValidators.emailValidator,
                ),
                SizedBox(
                  height: 30,
                ),
                PasswordTextField(
                  hintText: "Password",
                  controller: pwd,
                  validator: EvoteValidators.passwordValidator,
                ),
                //
                SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "forgot password?",
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  child: Text(
                    "SIGN IN",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w900),
                  ),
                  onPressed: () async {
                    if (_key.currentState!.validate()) {
                      final doRoute = await formSubmit(
                        context: context,
                        showError: true,
                        future: Future.delayed(
                          Duration(
                            seconds: 3,
                          ),
                          () {
                            return true;
                          },
                        ),
                      );
                      if (doRoute != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => Home(),
                          ),
                        );
                      }
                    }
                  },
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                      vertical: 20.0,
                    )),
                    backgroundColor: MaterialStateProperty.all(
                      Color(
                        0xff008751,
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Center(
                  child: RichText(
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.end,
                    textDirection: TextDirection.rtl,
                    softWrap: true,
                    maxLines: 1,
                    textScaleFactor: 1,
                    text: TextSpan(
                      text: "Don’t have an account? ",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 19,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Sign Up',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 19,
                            color: Color(
                              0xff008751,
                            ),
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              //
                              print("bsbjnvfdjbnjcbjc");
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignUp(),
                                ),
                              );
                              //
                            },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
