import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AfficherPopUp {
  Future openDialog(context) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
/*title: Column(
  children: [

  ],
),*/
          title: Column(
            children: [
              Image(image: AssetImage('images/OK.png')),
              SizedBox(
                height: 5,
              ),
              Text('Espace de suivi \ncréé avec succès',style: TextStyle(
                fontFamily: 'Alfa',
                fontSize: 26,
              ),),

              Text('Vous pouvez désormais poursuivre votre \n'
                  'demande d’ouverture de compte bancaire \n'
                  '                      \t   CIHBANK.',style: TextStyle
                (
                fontSize: 15,
                fontFamily: 'Avenir'
              ),)
            ],
          ),
          actions: [
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  CircularProgressIndicator();
                  Navigator.pop(context);
                 Navigator.pushNamed(context, "/signature");
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(248, 90, 1, 1),
                  // onSurface: Color.fromRGBO(248, 90, 1, 1),
                ),
                child: Text(
                  'Suivant',
                  style: TextStyle(fontSize: 19, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      );
}
