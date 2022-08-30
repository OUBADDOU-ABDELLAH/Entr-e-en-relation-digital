
import 'package:b3g/models/user.dart';
import 'package:b3g/widgets/OtpFunction.dart';
import 'package:b3g/widgets/PopUp.dart';
import 'package:b3g/widgets/StateProvider.appBar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class VerificationSms extends StatefulWidget {
  const VerificationSms({Key? key}) : super(key: key);

  @override
  State<VerificationSms> createState() => _VerificationSmsState();
}

class _VerificationSmsState extends State<VerificationSms> {
  Clients client = Clients("", "", "", "");
  AfficherPopUp _popUp = AfficherPopUp();
  StateProvider stateProvider = StateProvider();
  OTP txtOtp = OTP();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: stateProvider.app_bar('oui', "/verifierEmailOtp", context),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 25,
              ),
              Text('Sms de Verification ',
                  style: TextStyle(
                      color: Color.fromRGBO(248, 91, 1, 1),
                      fontSize: 22,
                      fontFamily: 'ArvoBold')),
              SizedBox(
                height: 20,
              ),
              Text(
                'Veuillez saisir le code confidentiel'
                ' reçu par SMS. \nNe communiquez ce code à personne.',
                style: TextStyle(fontSize: 15, fontFamily: 'avenir'),
              ),
              SizedBox(
                height: 50,
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
                  Text('-'),
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
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 12,
                        fontFamily: 'Chewy',
                      ),
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
                      text: "Renvoyer le SMS",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          Navigator.pushNamed(context, "");
                        }),
                ])),
              ),
            ],
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                _popUp.openDialog(context);
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
