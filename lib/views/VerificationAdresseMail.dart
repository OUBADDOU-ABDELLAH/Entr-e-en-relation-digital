import 'package:b3g/models/user.dart';
import 'package:flutter/material.dart';

class VerificationMail extends StatefulWidget {
  const VerificationMail({Key? key}) : super(key: key);

  @override
  State<VerificationMail> createState() => _VerificationMailState();
}

class _VerificationMailState extends State<VerificationMail> {
  Clients client = Clients("", "", "", "");
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: SafeArea(
            child: Column(

              children: [
                SizedBox(
                  height: 20,
                ) ,
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios,
                          color: Colors.blue, size: 20),
                      onPressed: () {
                        Navigator.pushNamed(context, "/passWord");
                      },
                    ),

                    Text( 'Verification de l\'adresse mail',
                        style: TextStyle(
                          color: Color.fromRGBO(248, 91, 1, 1),
                          fontSize: 18,
                          fontFamily: 'ArvoBold'
                        ),
                    ),
                  ],
                ),
                Image(
                  image: AssetImage('images/Emails.png'),
                  // width: 200,

                  fit: BoxFit.cover,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.lightbulb_circle_rounded,color: Colors.yellow,size: 30,),
                   SizedBox(
                     width: 5,
                   ),
                    Text('${client.getEmail()}',style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 20,
                      fontFamily: 'LatoBold'
                    )),
                  ],
                ),
SizedBox(
  height: 15,
),
                Text(
                    'Votre adresse e-mail est obligatoire pour finaliser votre demande .\n\n '
                    'Vous recevrez les documents relatifs a votre dossier d \'ouverture de compte sur cette adresse',
                style: TextStyle(
                  fontSize: 19,
                  fontFamily: 'Alfa'
                ),
                ),

               SizedBox(
                  height: 30,
                ),

                SizedBox(

                  width: double.infinity,
                  height: 50,
                  child:

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(0, 175, 240, 1), // background
                         // onPrimary: Colors.white, // foreground
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, "/verifierEmailOtp") ;
                        },
                        child: Text('Vérifier mon adresse mail',style: TextStyle(
                          color: Colors.white ,
                          fontSize: 18 ,
                          fontFamily: 'LatoBold'
                        ),),
                      ) ,

                  ),


                TextButton(onPressed: (){
                  Navigator.pushNamed(context, '/email') ;
                },
                    child: Text('Modifier mon adresse mail',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromRGBO(0, 175, 240, 1),
                      decoration: TextDecoration.underline,
                      fontFamily: 'LatoBold'


                    ),
                    )) ,

              ],
            ),
          ),
        ),
      ),
    );
  }
}
