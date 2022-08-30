import 'package:b3g/models/user.dart';
import 'package:b3g/widgets/FonctionTextFromField.dart';
import 'package:b3g/widgets/StateProvider.appBar.dart';
import 'package:b3g/widgets/SuivantPrecedent.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PageClient extends StatefulWidget {
  @override
  State<PageClient> createState() => _PageClientState();
}

class _PageClientState extends State<PageClient> {
  String? value;
  static String countryValue = 'Morocco';
  static bool isValidePrenom = false;
  static bool isValideNom = false;
  static String? pays = "Morocco";
  TextEditingController controll = TextEditingController();
  Clients client = new Clients("", "", "", "");
  final _formKey = GlobalKey<FormState>();
  ChampsClient champsClient = ChampsClient();
  SuivantPrecedent SP = SuivantPrecedent();
  StateProvider stateProvider = StateProvider();

  @override
  void initState() {
    super.initState();
  }

  void Envoyer() {
    if (countryValue == 'Morocco') {
      if (_formKey.currentState!.validate()) {
        Navigator.pushNamed(context, '/email');
      }
    } else {
      if (_formKey.currentState!.validate()) {
        Navigator.pushNamed(context, '/globalization');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: stateProvider.app_bar('', '', context),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Consumer<StateProvider>(
            builder: (context, counterState, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                              initialValue: client.getPrenom(),
                              decoration:
                                  champsClient.Input_Decoration('Prénom', ''),
                              style: champsClient.txt_style(),
                              onChanged: (value) {
                                setState(() {
                                  isValidePrenom =
                                      champsClient.changerStatus(value);
                                });
                                client.setPrenom(value);
                              },
                              validator: (value) {
                                return champsClient.Validateur(value, 'prenom');
                              }),
                          TextFormField(
                            initialValue: client.getNom(),
                            decoration:
                                champsClient.Input_Decoration('Nom', ''),
                            style: champsClient.txt_style(),
                            onChanged: (value) {
                              setState(() {
                                isValideNom = champsClient.changerStatus(value);
                              });
                              client.setNom(value);
                            },
                            validator: (value) {
                              return champsClient.Validateur(value, 'nom');
                            },
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 2,
                  ),
                  Text('Pays de résidence*',
                      style: TextStyle(color: Colors.grey, fontSize: 13)),
                  CSCPicker(
//defaultCountry: DefaultCountry.Morocco,
                    showStates: false,
                    showCities: false,

                    onCountryChanged: (value) {
                      setState(() {
                        countryValue = value;
                      });
                    },

                    dropdownItemStyle: TextStyle(
                      fontFamily: 'ArvoBold',
                    ),

                    dropdownHeadingStyle: TextStyle(
                        color: Colors.grey, fontSize: 15, fontFamily: 'Alfa'),
                    dropdownDecoration: BoxDecoration(
                        border: Border(
                            top: BorderSide.none,
                            right: BorderSide.none,
                            bottom: BorderSide(color: Colors.grey),
                            left: BorderSide.none)),
                    selectedItemStyle: TextStyle(fontFamily: 'Alfa'),
                    // currentCountry: ,

                    countryDropdownLabel: countryValue,
                    flagState: CountryFlag.DISABLE,
                    countrySearchPlaceholder: 'Recherchez...',
                  ),
                ],
              );
            },
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
          child: Row(
            children: [
              SP.Precedent('/ouvrirCompte', context),
              SizedBox(
                width: 10,
              ),
              SP.Suivant(isValidePrenom, isValideNom, Envoyer, context)
            ],
          ),
        ),
      ),
    );
  }
}
