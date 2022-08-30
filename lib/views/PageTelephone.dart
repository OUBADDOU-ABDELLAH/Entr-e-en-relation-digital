
import 'package:b3g/models/Countries.dart';
import 'package:b3g/models/user.dart';
import 'package:b3g/widgets/FonctionTextFromField.dart';
import 'package:b3g/widgets/StateProvider.appBar.dart';
import 'package:b3g/widgets/SuivantPrecedent.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Telephone extends StatefulWidget {
  const Telephone({Key? key}) : super(key: key);

  @override
  State<Telephone> createState() => _TelephoneState();
}


class _TelephoneState extends State<Telephone> {
  static bool show_hide=false ;
  Erreur(bool show_hide){
    if(show_hide==true){
      return Text(
          'Merci d\'introduire un numéro valide',
          style: TextStyle(color: Colors.red,
          fontSize: 17,
          fontFamily: 'ArvoBold'
          ));
    }
    else{
      return Text('',style: TextStyle(
          height: 0,color:Colors.transparent
      ),) ;
    }
  }
  StateProvider stateProvider = StateProvider();
  final _formKey = GlobalKey<FormState>();
  SuivantPrecedent SP = SuivantPrecedent();
  String? _selected;
  String? _selectedItem = '+212';
  //Operateurs operateur = Operateurs();
  Countries countries = Countries();
  List<Map>? _MyCountry = null;
  List<Map>? _myJson = null;
  ChampsClient champsClient = ChampsClient();
  Clients client = Clients("", "", "", "");
  static bool isValide=false;
  _TelephoneState() {
   // _myJson = operateur.myJson;
    _MyCountry = countries.AllCountries;
  }

   Envoyer(){
    if(_formKey.currentState!.validate()){
      Navigator.pushNamed(context, '/passWord') ;
      setState((){
        show_hide=false
        ;
      });
    }
     else{
     setState((){
     show_hide=true;
     });
    }
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: stateProvider.app_bar('','',context),
        body: SingleChildScrollView(
          //reverse: false,
          child: SafeArea(
              child: Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Bonjour,' + client.getPrenom().toString() + '!',
                  style: TextStyle(
                      color: Color.fromRGBO(248, 90, 1, 1),
                      fontSize: 22,
                      fontFamily: 'ArvoBold'),
                ),
                Text(
                  'Pour initier votre demande d\'ouverture de compte, '
                  'veuillez saisir votre numéro de téléphone mobile',
                  //style: TextStyle(fontSize: 16, fontFamily: 'Avenir'),
                    style: TextStyle(fontSize: 17,fontFamily: 'ArvoRegular')
                ),
                SizedBox(
                  height: 15,
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 90,
                              child: DropdownButtonFormField<String>(
                                // isDense: false ,

                                decoration: new InputDecoration(
                                  // border: InputBorder.none,
                                  filled: true,
                                  alignLabelWithHint: true,
                                  fillColor: Colors.white,
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(2, 0, 0, 0),
                                ),
                                value: _selectedItem,
                                items: _MyCountry?.map(
                                  (Map item) => DropdownMenuItem<String>(
                                    value: item['dial_code'],
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Image(
                                            image: AssetImage(
                                                'images/flags/flag_' +
                                                    item['code']
                                                        .toString()
                                                        .toLowerCase() +
                                                    '.png'),
                                            width: 25,
                                            height: 25,
                                          ),
                                          Text(
                                            item['dial_code'],
                                            style: TextStyle(
                                              fontSize: 15,
                                              //fontWeight: FontWeight.bold,
                                              fontFamily: 'avenir',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ).toList(),
                                onChanged: (item) =>
                                    setState(() => _selectedItem = item),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 270,
                              child:
                              //champsClient.txtFormField('telephone')
                              
                               TextFormField(
                                 onChanged: (value){
                                   client.setTel(value) ;

                                     setState((){
                                       isValide=champsClient.changerStatus(value) ;

                                     });

                                 },
                                initialValue: client.getTel(),
                                 decoration:champsClient.Input_Decoration('Numéro de téléphone','tel'),
                                validator: (value) {
                              return champsClient.Validateur(value, 'tel') ;
                                },
                                style: champsClient.txt_style(),
                                keyboardType: TextInputType.number,
                                inputFormatters:champsClient.InputFormaterTel('tel')
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                ),

               // Envoyer() ,
             //  Text(afficher().toString())
                SizedBox(height: 5,),
                Erreur(show_hide)
              ],
            ),
          )),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
          child: Row(
            children: [
              SP.Precedent('/email', context),
              SizedBox(
                width: 10,
              ),
             SP.Suivant(isValide, true,Envoyer, context),
            ],
          ),
        ),
      ),
    );
  }
}
