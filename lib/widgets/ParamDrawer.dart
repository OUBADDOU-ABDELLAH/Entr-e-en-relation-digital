import 'package:flutter/material.dart';

class GlobalParams {
  static List<Map<String, dynamic>> Liste2 = [
    {
      "couleur": Colors.blueAccent,
      "title": Text(
        'J\'active mon compte ',
      ),
      "route": "/activerCompte"
    },
    {
      "couleur": Colors.orange,
      "title": Text(
        'Je me connecte',
      ),
      "route": "/seConnecter"
    },

    {
      "couleur": Colors.white,
      "title": Text(
        'Je deviens client',style: TextStyle(color: Colors.orange),
      ),
      "route": "/ouvrirCompte",
      "side":BorderSide(width: 1.5, color: Colors.orange),
    },
  ];


  static List<Map<String, dynamic>> Liste1 = [
    {
      "title": Text(
        'Choisir la langue',
        style: TextStyle(fontSize: 19, color: Colors.indigo),
      ),
      "icon": Icon(
        Icons.language_outlined,
        color: Colors.indigo,
      ),
      "route": "/choisirLangue"
    },
    {
      "title": Text(
        'Cours de change',
        style: TextStyle(fontSize: 19, color: Colors.indigo),
      ),
      "icon": Icon(
        Icons.change_circle_outlined,
        color: Colors.indigo,
      ),
      "route": "/coursChange"
    },
    {
      "title": Text(
        'Application et Sites web CIH BANK',
        style: TextStyle(fontSize: 19, color: Colors.indigo),
      ),
      "icon": Icon(
        Icons.apps,
        color: Colors.indigo,
      ),
      "route": "/coursChange"
    },
    {
      "title": Text(
        'Mode Démonstration',
        style: TextStyle(fontSize: 19, color: Colors.indigo),
      ),
      "icon": Icon(
        Icons.play_circle,
        color: Colors.indigo,
      ),
      "route": "/modeDemonstration"
    },
    {
      "title": Text(
        'Nous Trouver',
        style: TextStyle(fontSize: 19, color: Colors.indigo),
      ),
      "icon": Icon(
        Icons.location_on_sharp,
        color: Colors.indigo,
      ),
      "route": "/trouver"
    },
    {
      "title": Text(
        'Nous Contacter',
        style: TextStyle(fontSize: 19, color: Colors.indigo),
      ),
      "icon": Icon(
        Icons.call,
        color: Colors.indigo,
      ),
      "route": "/contacter"
    },
  ];
}
