import 'package:evote/component/app_text.dart';
import 'package:evote/component/buttons/app_button.dart';
import 'package:evote/component/inputs/app_date_input.dart';
import 'package:evote/component/inputs/app_password_input.dart';
import 'package:evote/component/inputs/app_sized_box.dart';
import 'package:evote/component/inputs/app_text_field.dart';
import 'package:evote/component/inputs/monee_pin_entry.dart';
import 'package:evote/styles/colors.dart';
import 'package:evote/utils/typedefs.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'dashed.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stepper(
          type: StepperType.horizontal,
          currentStep: currentIndex,
          elevation: 0.0,
          controlsBuilder: (context, {onStepCancel, onStepContinue}) {
            return EvoteButton(
                text: "NEXT",
                onPressed: () {
                  if (onStepContinue != null) onStepContinue();
                });
          },
          onStepContinue: () {
            if (currentIndex < 3) {
              setState(
                () => currentIndex++,
              );
            }
          },
          steps: [
            Step(
              title: EvoteText("1"),
              content: Column(
                children: [
                  EvoteText("Sign Up"),
                  EvoteTextField(
                    hintText: "Name",
                  ),
                  EvoteSizedBox(
                    height: 2,
                  ),
                  EvoteTextField(
                    hintText: "Email",
                  ),
                  EvoteSizedBox(
                    height: 2,
                  ),
                  EvoteTextField(
                    hintText: "Location",
                  ),
                  EvoteSizedBox(
                    height: 2,
                  ),
                  EvoteTextField(
                    hintText: "Phone Number",
                  ),
                  EvoteSizedBox(
                    height: 2,
                  ),
                  EvoteDateInput(
                    TextEditingController(),
                    hintText: "Name",
                  ),
                  EvoteSizedBox(
                    height: 2,
                  )
                ],
              ),
            ),
            Step(
              title: EvoteText("2"),
              content: Column(
                children: [
                  EvoteText("OTP"),
                  EvoteSizedBox(
                    height: 2,
                  ),
                  EvoteText(
                    "A One Time Password has been sent to the mobie number linked to your PVC, ending with 2332",
                    textAlign: TextAlign.center,
                  ),
                  EvoteSizedBox(
                    height: 2,
                  ),
                  EvotePinInput(
                    length: 4,
                    onCompleted: (s) {},
                  ),
                  RichText(
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.end,
                    textDirection: TextDirection.rtl,
                    softWrap: true,
                    maxLines: 1,
                    textScaleFactor: 1,
                    text: TextSpan(
                      text: "Didn’t recieve an OTP? ",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 19,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Resend OTP',
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
                  EvoteSizedBox(
                    height: 5,
                  )
                ],
              ),
            ),
            Step(
              title: EvoteText("3"),
              content: Column(
                children: [
                  EvoteSizedBox(
                    height: 2,
                  ),
                  EvoteText("Create Password"),
                  EvoteSizedBox(
                    height: 10,
                  ),
                  PasswordTextField(
                    hintText: "Password",
                  ),
                  EvoteSizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
            Step(
              title: EvoteText("4"),
              content: Column(
                children: [
                  EvoteText("Fingerprint"),

                  EvoteSizedBox(
                    height: 10,
                  ),
                  // Container(
                  //   decoration: BoxDecoration(
                  //     color: Color(
                  //       0xFFF1F1F,
                  //     ),
                  //     borderRadius: BorderRadius.all(
                  //       Radius.circular(
                  //         10.0,
                  //       ),
                  //     ),
                  //   ),
                  // child:
                  DashedRect(
                    color: Colors.green,
                    strokeWidth: 2.0,
                    gap: 3.0,
                    child: Icon(
                      Icons.fingerprint_outlined,
                      color: EvoteColors.white, size: 300.0,
                      // ),
                    ),
                  ),
                  EvoteSizedBox(
                    height: 2,
                  ),
                  EvoteText(
                    "Tap on the box to continue",
                  ),

                  EvoteSizedBox(
                    height: 2,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
