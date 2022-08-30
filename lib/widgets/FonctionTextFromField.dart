
import 'package:b3g/models/user.dart';
import 'package:b3g/widgets/StateProvider.appBar.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChampsClient {
  static String Hinttxt = '';
  Clients client = Clients('', '', '', '');
  StateProvider stateProvider=StateProvider() ;
  changerStatus(String valeur){
    if(valeur!=''){
      return true ;
    }
    else{
     return false ;
    }
  }

  Widget txtFormField(String var_txt,String hinttxt,void setState(String val )) {
    return TextFormField(
      initialValue: Get_X(var_txt),
      autovalidateMode: AutovalidateMode.disabled,
      style: TextStyle(
        fontSize: 19,
        fontWeight: FontWeight.bold,
      ),
      decoration: InputDecoration(
        errorBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        hintText: hinttxt,
        hintStyle: TextStyle(
          color: Colors.grey[600],
          fontSize: 19,
          fontWeight: FontWeight.bold,
        ),
      ),
      onChanged: (value) {
        setState(value) ;
        Set_X(value, var_txt);
      },
      keyboardType: InputKeyBoard(var_txt),
      inputFormatters:InputFormaterTel(var_txt) ,
        validator: (value) {
        if (value == null || value.isEmpty) {
          return '';
        }
        if (var_txt == 'email') {
          return Validateur(value, var_txt);
        }
        if (var_txt == 'telephone') {
          return Validateur(value, var_txt);
        }
        if (var_txt == 'prenom') {
          return Validateur(value, var_txt);
        }

      },
    );
  }

txtStyleError(String champs){
    if(champs=='tel'){
      return  TextStyle(
        color: Colors.transparent,
        height:0,
        // backgroundColor: Colors.grey,
        // fontFamily: 'ArvoRegular',
        fontSize: 0,
      );
    }
    else{
      return  TextStyle(
        color: Colors.red,
        height:0,
        // backgroundColor: Colors.grey,
         fontFamily: 'ArvoBold',
        fontSize: 17,
      );
    }
}
  Validateur(value, name) {
    switch (name) {
      case 'prenom' :
          if ( (!RegExp("(?=.*[A-Z])").hasMatch(value!) && !RegExp("(?=.*[a-z])").hasMatch(value!))) {
            return 'Prénom invalide' ;
          }
          break ;
      case 'nom' :
        if ( (!RegExp("(?=.*[A-Z])").hasMatch(value!) && !RegExp("(?=.*[a-z])").hasMatch(value!))) {
          return 'Nom de famille invalide' ;
        }
        break ;
      case 'email':
        if (!EmailValidator.validate(value!)) {
          return '*email invalide';
        }
        return null ;

        break;
      case 'passWord':
        /* if(){
          return 'Le mot de passe doit contenir au moins 6\n'
              'caractères alphanumeriques';
        }*/

        break;
      case 'telephone':
        if (value.length < 9) {
          return 'Merci d\'introduire un numéro de \ntéléphone valide';
        }
        break;
      case 'tel':
        if(!RegExp(r'(^(?:[+0]9)?[0-9]{9,12}$)').hasMatch(value!)){
          return '';
        }
    }
  }


  void Set_X(valeur, name) {
    switch (name) {
      case 'prenom':
        client.setPrenom(valeur);
        //print(i) ;
        break;

      case 'nom':
        client.setNom(valeur);
        // print(i);
        break;

      case 'email':
        client.setEmail(valeur);
        break;
      case 'telephone':
        client.setTel(valeur);
        break;
    }
  }
  Get_X(name) {
    switch (name) {
      case 'prenom':
        return client.getPrenom();

      case 'nom':
        return client.getNom();

      case 'email':
        return client.getEmail();

      case 'telephone':
        return client.getTel();
    }
  }

  TextErreur(erreur) {
    switch (erreur) {
      case 'email':
        return '*email invalid';
    }
  }

  InputKeyBoard(valeur) {
    if (valeur == 'telephone')
      return TextInputType.number;
    else
      return TextInputType.text;
  }
  InputFormaterTel(valeur) {
    if (valeur == 'tel')
      return [
        LengthLimitingTextInputFormatter(10),
        FilteringTextInputFormatter.digitsOnly,
      ];

  }



  Input_Decoration(String hinttxt,String NomChamps){
    return InputDecoration(
      errorBorder:
      UnderlineInputBorder( borderSide: BorderSide(color: Colors.grey)),
      focusedErrorBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),

      errorStyle:
      txtStyleError(NomChamps),
      hintText: hinttxt,
      hintStyle: TextStyle(
        color: Colors.grey[600],
        fontSize: 19,
        fontWeight: FontWeight.bold,
      ),
    );
  }
  txt_style(){
    return TextStyle(
      fontSize: 19,
      fontWeight: FontWeight.bold,
      // fontFamily: 'Alfa'
    );
  }

}

