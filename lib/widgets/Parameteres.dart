import 'package:flutter/material.dart';
class ParamsHome{
  static List<Map<String,dynamic>> Liste = [
    {
      "couleur": Colors.white,
      "title": Text(
        'Je me connecte ',
        style: TextStyle(color: Colors.black,fontSize: 20),
      ),

      "route": "/activerCompte",
      "side":BorderSide(width: 2, color: Colors.black),
    },


    {
      "couleur": Colors.white,
      "title": Text(
        'J\'active mon compte',
        style: TextStyle(color: Colors.black,fontSize: 20),
      ),
      "route": "/seConnecter",
      "side":BorderSide(width: 2, color: Colors.black),
    },

    {
      "couleur": Colors.blueAccent,
      "title": Text(
        'Je deviens client',style: TextStyle(color: Colors.white,fontSize: 20),
      ),
      "route": "/ouvrirCompte",
     // "side":BorderSide(width: 1.5, color: Colors.orange),
    },
  ];

  static List<Map<String,dynamic>> ListeO_S = [
    {
      "couleur": Color.fromRGBO(248, 90, 1,1),
      "title": Text(
        'Ouvrir un compte ',
        style: TextStyle(color: Colors.white,fontSize: 20,
            fontFamily: 'ArvoBold'),
      ),

      "route": "/client",
     // "side":BorderSide(width: 2, color: Colors.black),
    },


    {
      "couleur": Colors.white,
      "title": Text(
        'Suivre ma demande d\'ouverture',
        style: TextStyle(
          color: Color.fromRGBO(248, 90, 1,1),
          fontSize: 20,
            fontFamily: 'ArvoBold'

        ),
      ),
      "route": "/suivreDemande",
      "side":BorderSide(width: 2, color: Color.fromRGBO(248, 90, 1,1),),
    },

  ];

}