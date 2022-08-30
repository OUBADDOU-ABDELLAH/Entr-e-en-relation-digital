
import 'package:b3g/models/user.dart';
import 'package:b3g/widgets/FonctionTextFromField.dart';
import 'package:b3g/widgets/StateProvider.appBar.dart';
import 'package:b3g/widgets/SuivantPrecedent.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Email extends StatefulWidget {
  @override
  State<Email> createState() => _EmailState();
}

class _EmailState extends State<Email> {
  SuivantPrecedent SP = SuivantPrecedent();
  ChampsClient champsClient = ChampsClient();
  StateProvider stateProvider = StateProvider();
  Clients client = Clients("", "", "", "");
  final _formKey = GlobalKey<FormState>();
  static bool isEmailValide = false;
  void Envoyer() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(context, '/telephone');
    }
  }

  String email = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: stateProvider.app_bar('', '', context),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(24, 0, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Veuillez entrer votre adresse e-mail',
                  style: TextStyle(
                      color: Color.fromRGBO(248, 90, 1, 1),
                      fontSize: 22,
                      fontFamily: 'ArvoBold'),
                ),
                Text(
                  'Un e-mail de vérification vous sera envoyé.',
                  style: TextStyle(fontSize: 15, fontFamily: 'ArvoRegular'),
                ),
                SizedBox(
                  height: 20,
                ),
                Consumer<StateProvider>(
                    builder: (context, counterState, child) {
                  return Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          initialValue: client.getEmail(),
                          decoration:
                              champsClient.Input_Decoration('Email', ''),
                          onChanged: (value) {
                            client.setEmail(value);
                            setState(() {
                              isEmailValide = champsClient.changerStatus(value);
                            });
                          },
                          validator: (value) {
                            return champsClient.Validateur(value, 'email');
                          },
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
          child: Row(
            children: [
              SP.Precedent('/client', context),
              SizedBox(
                width: 10,
              ),
              SP.Suivant(isEmailValide, true, Envoyer, context)
            ],
          ),
        ),
      ),
    );
  }
}