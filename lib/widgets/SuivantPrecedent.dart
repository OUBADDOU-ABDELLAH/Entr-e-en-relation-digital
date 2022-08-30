import 'package:flutter/material.dart';
class SuivantPrecedent{

  Precedent(String url,context){
    return  SizedBox(
      width: 140,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          CircularProgressIndicator();
          Navigator.pushNamed(context,url);
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
        ),
        child: Text(
          'Précédent',
          style: TextStyle(
            fontSize: 18,
            color: Color.fromRGBO(248, 90, 1, 1),
            fontFamily: 'ArvoBold',
          ),
        ),
      ),
    );
  }
  Suivant(bool condition1,bool condition2,void Send() ,context){
    return SizedBox(
      width: 220,
      height: 50,
      child: ElevatedButton(
        onPressed: (condition1 && condition2) ?
       Send :null ,

        style: ElevatedButton.styleFrom(
          primary: Color.fromRGBO(248, 90, 1, 1),
          onSurface: Color.fromRGBO(248, 90, 1, 1),
        ),
        child: Text(
          'Suivant',
          style: TextStyle(fontSize: 18, fontFamily: 'ArvoBold',color: Colors.white),
        ),
      ),
    );
  }

  }



