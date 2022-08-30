
import 'package:b3g/models/user.dart';
import 'package:b3g/widgets/SuivantPrecedent.dart';
import 'package:flutter/material.dart';
class SpecimenSignature extends StatefulWidget {
  const SpecimenSignature({Key? key}) : super(key: key);

  @override
  State<SpecimenSignature> createState() => _SpecimenSignatureState();
}

class _SpecimenSignatureState extends State<SpecimenSignature> {
  Clients client = Clients("", "", "", "");
  SuivantPrecedent SP = SuivantPrecedent();
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(

        backgroundColor: Colors.white,
        appBar: AppBar(

          toolbarHeight: 75,
          automaticallyImplyLeading: false,
          // title: Text('App Bar!'),
          elevation: 0,

title: Padding(
  padding: const EdgeInsets.fromLTRB(85,50,0,0),
  child:   Text('Spécimen Signature', style: TextStyle(
      color: Color.fromRGBO(248, 91, 1, 1),
      fontSize: 18,
      fontFamily: 'ArvoBold'
  ),
  ),
),
          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: ElevatedButton(
                onPressed: () {
                  client.openDialog(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  elevation: 0,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.headset_mic,
                      size: 27,
                      color: Color.fromRGBO(248, 91, 1, 1),
                    ),
                    Text(
                      'Besoin\n d\'aide',
                      style: TextStyle(
                          color: Color.fromRGBO(112, 112, 112, 1),
                          fontSize: 11,
                          fontFamily: 'LatoBold'),
                    ),
                  ],
                ),
              ),
            ),
          ],

          backgroundColor: Colors.white,
        ),

body: Padding(
  padding: const EdgeInsets.fromLTRB(20,0,20,0),
  child:   Column(

    children: [

      //Image

      //Text
SizedBox(height:10 ,),
      Image(image: AssetImage(
        'images/bank.jpg'
      )),
      Text('La signature digitale sera apposée sur les documents'

          ' contractuels qui vous seront envoyé par mail sans'

          ' devoir vous déplacer en l\'agence.', style: TextStyle(
          fontSize: 19,
          fontFamily: 'Alfa'
      ),)

    ],

  ),
),

floatingActionButton: Padding(
  padding: const EdgeInsets.fromLTRB(40,0,0,0),
  child:   Row(
      children: [
        SP.Precedent('/verifierSmsOtp', context),
        SizedBox(
          width: 10,
        ),
        SizedBox(
          width: 220,
          height: 50,
          child: ElevatedButton(
            onPressed:
                 () {
              CircularProgressIndicator();
Navigator.pushNamed(context, '/getSignature') ;
            },

            style: ElevatedButton.styleFrom(
              primary: Color.fromRGBO(248, 90, 1, 1),
              onSurface: Color.fromRGBO(248, 90, 1, 1),
            ),
            child: Text(
              'Suivant',
              style: TextStyle(fontSize: 19, color: Colors.white,
                  fontFamily:'ArvoBold' ),
            ),
          ),
        ),
      ],

  ),
),
      ),
    );
  }
}
