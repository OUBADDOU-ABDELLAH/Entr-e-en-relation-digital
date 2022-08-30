import 'package:flutter/material.dart';

class Clients {
  static String? Prenom;
  static String? Nom;
  static String? Tel;
  static String? phone ;
  static String? Email;
  static String? MotPass;
  static bool status=false ;
  Clients(Prenom, Nom, Email, Tel);
  setPrenom(String p) {
    Prenom= p;
  }
  String? getPrenom() {
    return  Prenom ;
  }


  setStatus(bool stt) {
    status= stt;
  }
  bool? getStatus() {
    return  status ;
  }



  setPass(String keyWord) {
    MotPass= keyWord;
  }
  String? getPass() {
    return  MotPass ;
  }

  setNom(String n) {
    Nom= n;
  }
  String? getNom() {
    return Nom ;
  }

  setEmail(String e) {
    Email= e;
  }
  String? getEmail() {
    return Email ;
  }

  setTel(String t) {
    Tel= t;
  }
  String? getTel() {
    return Tel ;
  }


  setPhone(String pho) {
    phone=pho;
  }
  String? getPhone() {
    return phone ;
  }



  Future openDialog(context)=>showDialog(
    context: context,
    builder: (context)=>AlertDialog(
      title: Image(image: AssetImage('images/logo.jpg')),
      content:Text('Besoin d\'aide') ,

    ),
  ) ;

}


