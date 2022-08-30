import 'package:b3g/views/MotDePasse.dart';
import 'package:b3g/views/MyHome.dart';
import 'package:b3g/views/OuvrirCompte.dart';
import 'package:b3g/views/PageClient.dart';
import 'package:b3g/views/PageEmail.dart';
import 'package:b3g/views/PageOk.dart';
import 'package:b3g/views/PageSignatureSpecimen.dart';
import 'package:b3g/views/PageTelephone.dart';
import 'package:b3g/views/Signature.dart';
import 'package:b3g/views/VerificationAdresseMail.dart';
import 'package:b3g/views/VerificationSmsOtp.dart';
import 'package:b3g/views/VerifierEmailOtp.dart';
import 'package:b3g/widgets/StateProvider.appBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>StateProvider(),)
      ],
      child: MaterialApp(
        routes: {
          "/client":(context)=>PageClient() ,
          "/ouvrirCompte":(context)=>OuvrirCompte(),
          "/myHome":(context)=>MyHome(),
         // "/choisirLangue":(context)=>ChoisirLangue(),
          "/email":(context)=>Email(),
          "/telephone":(context)=>Telephone(),
         // "/envoyer":(context)=> Envoyer(),
          "/passWord":(context)=>PassWord(),
          "verifierMail":(context)=>VerificationMail() ,
          "/globalization":(context)=>Globalization() ,
          "/verifierEmailOtp":(context)=>VerifierEmailOtp() ,
          "/verifierSmsOtp":(context)=>VerificationSms() ,
          "/signature":(context)=>SpecimenSignature() ,
          "/getSignature":(context)=>Signature_CIH(),
        },

        initialRoute: "/myHome",
        debugShowCheckedModeBanner: false,
        home: MyHome(),
      ),
    );
  }
}