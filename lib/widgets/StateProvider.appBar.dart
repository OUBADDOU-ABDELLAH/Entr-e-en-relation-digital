
import 'package:b3g/models/user.dart';
import 'package:flutter/material.dart';

class StateProvider extends ChangeNotifier {
  static bool isVerified = false;
  static String url = '';
  static String condition = '';
  static String url2 = '';
  static String condition2 = '';
  static String pays='' ;
  static bool isChecked=false ;
  static bool isValide=false ;
  static bool cdt=false ;

Clients client =Clients("","","","") ;

 app_bar(String addIcon,String url,context){
  return  AppBar(
    toolbarHeight: 120,
    automaticallyImplyLeading: false,
    elevation: 0,
    flexibleSpace: Padding(
      padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
      child: Option_icon(addIcon,url,context)
    ),

    actions: [
      Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
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
  );
}
Option_icon(String addIcon,String url,context){
   if(addIcon=='oui'){
     return Row(
       children: [
         IconButton(
           icon:
           Icon(Icons.arrow_back_ios, color: Colors.blue, size: 20),
           onPressed: () {
             Navigator.pushNamed(context,url);
           },
         ),
         SizedBox(
           width: 80,
         ),
         SizedBox(
           //TODO il faut regler la taille de l'image
           height: 50,
           //width: double.infinity,
           child: Image(
             image: AssetImage('images/B3G.png'),
            // fit: BoxFit.fitHeight,
             //width: 50,
           ),
         )
       ],
     );
   }
   else{
     return Padding(
       padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
       child: Image(
         image: AssetImage('images/B3G.png'),
         fit: BoxFit.fitHeight,
         //width: 50,
       ),
     );
   }
}
  final formKey = GlobalKey<FormState>();

void Envoyer(){
  if (formKey.currentState!.validate()) {
  }
}

}
