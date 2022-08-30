import 'package:flutter/material.dart' ;
class Globalization extends StatefulWidget {
  const Globalization({Key? key}) : super(key: key);

  @override
  State<Globalization> createState() => _GlobalizationState();
}

class _GlobalizationState extends State<Globalization> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,

        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 90,
          automaticallyImplyLeading: false,
          elevation: 0,
          flexibleSpace: Padding(
            padding: const EdgeInsets.fromLTRB(0,40,0,0),
            child: Image(
              image: AssetImage('images/logo.jpg'),
              fit: BoxFit.fitHeight,
              //width: 50,
            ),
          ),
         // backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20,0,20,0),
          child: Column(
            children: [
              Image(image: AssetImage('images/Globalization.jpg')
                  ,height: 200,width: double.infinity,fit: BoxFit.fill,),
              Text('En tant que Marocain du monde CIH Bank vous propose une offre privilégiée :',
              style: TextStyle(fontSize: 17,
              fontFamily: 'ArvoBold',
                color: Color.fromRGBO(0, 57, 99, 1),
                fontWeight: FontWeight.bold
              ),
              ) ,
              Text('\n• Compte exonéré des frais de tenue de compte\n'
                  '• Carte internationale gratuite avec comme choix : une version virtuelle ou physique\n'
                  '• Gestion de vos comptes à distance depuis l’application Cih Mobile\n'
                  '• L’ajout et la visualisation (solde et historique) de vos comptes bancaires en Europe sur l’espace Cih Mobile\n'
                  '• Transfert d’argent direct depuis vos comptes à l’étranger vers vos comptes Cih Bank',
              style: TextStyle(
                fontSize: 17,
                  color: Color.fromRGBO(0, 57, 99, 1) ,
                fontFamily: 'ArvoRegular'
              ),
              ),
SizedBox(
  height: 5,
),
              SizedBox(
                width: double.infinity,
                height: 45,

                child: ElevatedButton(

                  onPressed: (){
                    Navigator.pushNamed(context, '/email');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(248, 90, 1, 1),
                    // onSurface: Color.fromRGBO(248, 90, 1, 1),

                  ),
                  child: Text(
                    'Ok',
                    style: TextStyle(fontSize: 19,color: Colors.white),
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
