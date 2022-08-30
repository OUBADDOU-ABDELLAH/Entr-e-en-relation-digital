import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class OTP {
  TEXTFIELD_OTP(context){
    return  SizedBox(
      width: 36,
      height: 37,
      child: TextFormField(
       // cursorHeight: 37,
        decoration: new InputDecoration(
          border: InputBorder.none,
          filled: true,
          alignLabelWithHint: false,
          fillColor: Color.fromRGBO(240, 240, 240, 1),
          contentPadding: const EdgeInsets.fromLTRB(2.5, 0, 0, 13),
          focusedBorder: OutlineInputBorder(
            borderSide: new BorderSide(color: Color.fromRGBO(248, 91, 1, 1),
                width: 2),
            // borderRadius: new BorderRadius.circular(25.7),

          ),),
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Color.fromRGBO(0, 175, 239, 1) ,
          fontFamily: 'Alfa'
        ),
        onChanged: (value){
          if(value.length==1){
            FocusScope.of(context).nextFocus() ;
          }
        },

        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],

      ),
    );
  }
}