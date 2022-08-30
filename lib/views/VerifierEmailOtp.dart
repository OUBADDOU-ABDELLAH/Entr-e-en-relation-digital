
import 'package:b3g/models/user.dart';
import 'package:b3g/widgets/OtpFunction.dart';
import 'package:b3g/widgets/StateProvider.appBar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class VerifierEmailOtp extends StatefulWidget {
  const VerifierEmailOtp({Key? key}) : super(key: key);
  @override
  State<VerifierEmailOtp> createState() => _VerifierEmailOtpState();
}

class _VerifierEmailOtpState extends State<VerifierEmailOtp> {
  StateProvider stateProvider = StateProvider();
  var defaulStyle =
      TextStyle(color: Colors.blue, fontSize: 12, fontFamily: 'Chewy');
  Clients client = Clients("", "", "", "");
  OTP txtOtp = OTP();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: stateProvider.app_bar('oui', "verifierMail", context),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 150),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 25,
                ),
                Text('Verification de l\'adresse mail',
                    style: TextStyle(
                        color: Color.fromRGBO(248, 91, 1, 1),
                        fontSize: 22,
                        fontFamily: 'ArvoBold')),
                Text(
                  '\nConfirmez qu\'il s\'agit bien de vous en introduisant le code de confirmation reçu pa Email.\n'
                  ' Ne communiquez ce code à personne.',
                  style: TextStyle(fontSize: 15, fontFamily: 'ArvoRegular'),
                ),
                SizedBox(
                  height: 20,
                ),
                Form(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        txtOtp.TEXTFIELD_OTP(context),
                        SizedBox(
                          width: 10,
                        ),
                        txtOtp.TEXTFIELD_OTP(context),
                      ],
                    ),
                    Text('-',style: TextStyle(fontWeight: FontWeight.bold),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        txtOtp.TEXTFIELD_OTP(context),
                        SizedBox(
                          width: 10,
                        ),
                        txtOtp.TEXTFIELD_OTP(context),
                      ],
                    ),
                    Text('-'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        txtOtp.TEXTFIELD_OTP(context),
                        SizedBox(
                          width: 10,
                        ),
                        txtOtp.TEXTFIELD_OTP(context),
                      ],
                    )
                  ],
                )),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        style: defaulStyle,
                        text: "Vous n'\avez pas reçu le code ?",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            Navigator.pushNamed(context, "");
                          }),
                  ])),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                          fontSize: 12,
                          fontFamily: 'Chewy',
                        ),
                        text: "Renvoyer le code",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            Navigator.pushNamed(context, "");
                          }),
                  ])),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/verifierSmsOtp");
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(248, 90, 1, 1),
                onSurface: Color.fromRGBO(248, 90, 1, 1),
              ),
              child: Text(
                'Valider',
                style: TextStyle(
                    fontSize: 17, color: Colors.white, fontFamily: 'ArvoBold'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
