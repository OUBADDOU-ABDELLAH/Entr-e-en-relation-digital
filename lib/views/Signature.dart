import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

class Signature_CIH extends StatefulWidget {
  const Signature_CIH({Key? key}) : super(key: key);

  @override
  State<Signature_CIH> createState() => _Signature_CIHState();
}

class _Signature_CIHState extends State<Signature_CIH> {
  SignatureController _controller=SignatureController(
    penColor: Colors.black,
    penStrokeWidth: 4,

  );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(

          toolbarHeight: 80,
          elevation: 0,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title:Padding(
            padding: const EdgeInsets.fromLTRB(0,30,0,0),
            child: Row(
              children: [
                IconButton(onPressed: (){
                  Navigator.pushNamed(context, '/signature');
                },
                    icon:Icon(Icons.arrow_back,size: 20),
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 100,
                ),
                Center(
                  child: Text('Signature',style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'ArvoBold'
                  ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20,0,20,0),
          child: Column(
children: [
  SizedBox(
    height: 10,
  ),
  Text('Merci de déposer votre signature sur '
      'l\'écran à l\'aide de votre doigt en respectant le cadre',
  style: TextStyle(
    color: Colors.black,
    fontSize: 15 ,
    fontFamily: 'ArvoRegular'
  ),
  ),
  SizedBox(height: 20,),



  Container(
    decoration:BoxDecoration(
      border: Border.all(
        color: Colors.grey,
        width: 2
      )
    ),
    child: Signature(
      controller: _controller,
      backgroundColor: Colors.white,
      height: 430,
      // width: double.infinity,
    ),
  ),


],
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.fromLTRB(30,0,0,0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
children: [
  SizedBox(
    width: 143,
    height: 50,
    child: ElevatedButton(onPressed: (){
      setState((){
      _controller.clear() ;
    });},
      child: Text('Effacer',style: TextStyle(
        color: Color.fromRGBO(248, 91, 1, 1),
        fontSize: 17,
        fontWeight: FontWeight.bold,
        fontFamily: 'ArvoBold'
      ),),
      style: ElevatedButton.styleFrom(
        side: BorderSide(
            width: 2,
        color: Color.fromRGBO(248, 91, 1, 1),
        ),
        primary: Colors.white,
      ),
    ),
  ),
SizedBox(
  width: 143,
  height: 50,
  child:   ElevatedButton(onPressed: (){

  },

      child: Text('Valider',
      style: TextStyle(
        fontSize: 17,
          fontWeight: FontWeight.bold,
        fontFamily: 'ArvoBold'
      ),
      ),

  style: ElevatedButton.styleFrom(

    primary: Color.fromRGBO(248, 91, 1, 1)

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
