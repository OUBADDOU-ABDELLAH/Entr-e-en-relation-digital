
import 'package:b3g/models/user.dart';
import 'package:b3g/widgets/StateProvider.appBar.dart';
import 'package:b3g/widgets/SuivantPrecedent.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class PassWord extends StatefulWidget {
  const PassWord({Key? key}) : super(key: key);

  @override
  State<PassWord> createState() => _PassWordState();
}

class _PassWordState extends State<PassWord> {
  Clients client = Clients("", "", "", "");
  SuivantPrecedent SP = SuivantPrecedent();
  static bool? isChecked = false;
  static bool? isPasswordCorrect = false;
  static String _password = '';
  late TextEditingController ControllerPassWord;
  @override
  void initState() {
    ControllerPassWord = TextEditingController();
    ControllerPassWord.text = '';
    // TODO: implement initState
    super.initState();
  }

  void Envoyer() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(context, 'verifierMail');
    }
  }

  var defaultStyle1 = TextStyle(color: Colors.black);
  static bool show_hide = true;
  Erreur(bool show_hide) {
    if (show_hide == true) {
      return Text(
          'le mot de passe doit contenir au moins 6 caractéres alphanumérique',
          style: TextStyle(color: Colors.grey));
    } else {
      return Text(
        '',
        style: TextStyle(height: 0, color: Colors.transparent),
      );
    }
  }

  StateProvider stateProvider = StateProvider();
  static String _confirmPassword = '';
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: stateProvider.app_bar('', '', context),
        body: SingleChildScrollView(
          reverse: true,
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Définissez un mot de passe',
                      style: TextStyle(
                          color: Color.fromRGBO(248, 91, 1, 1),
                          fontSize: 22,
                          fontFamily: 'ArvoBold')),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    'Votre mot de passe vous permettra de vous '
                    'connecter a votre espace de suivi',
                    style: TextStyle(fontSize: 17, fontFamily: 'ArvoRegular'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          initialValue: client.getPass(),
                          onChanged: (value) {
                            client.setPass(value);
                            if ((!RegExp("(?=.*[A-Z])").hasMatch(value) &&
                                    !RegExp("(?=.*[a-z])").hasMatch(value)) ||
                                !RegExp("(?=.*[0-9])").hasMatch(value) ||
                                value.length < 6) {
                              setState(() {
                                show_hide = true;
                              });
                            } else {
                              setState(() {
                                show_hide = false;
                              });
                            }
                            ;
                            setState(() {
                              // PassWord=value ;
                              _password = value;
                              if (_password == _confirmPassword &&
                                  value.length >= 3) {
                                isPasswordCorrect = true;
                              } else {
                                isPasswordCorrect = false;
                              }
                            });
                          },
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            // errorText:,
                            hintText: 'Mot de passe',
                            suffixIcon: IconButton(
                              color: Colors.blue,
                              icon: Icon(
                                _obscureText
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: (() {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              }),
                            ),
                          ),
                          obscureText: _obscureText,
                        ),
                        Erreur(show_hide),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          //controller: ControllerPassWord,
                          onChanged: (valeur) {
                            setState(() {
                              _confirmPassword = valeur;
                              if (_password == _confirmPassword) {
                                //&& valeur.length>=3
                                isPasswordCorrect = true;
                              } else {
                                isPasswordCorrect = false;
                              }
                            });
                          },
                          initialValue: client.getPass(),
                          validator: (valeur) {
                            setState(() {
                              _confirmPassword = valeur!;
                              if (_password == _confirmPassword &&
                                  valeur.length >= 3) {
                                isPasswordCorrect = true;
                              } else {
                                isPasswordCorrect = false;
                              }
                            });
                            // client.setPass(valeur);
                          },

                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              hintText: 'Confirmer votre mot de passe',
                              hintStyle: TextStyle(color: Colors.grey),
                              suffixIcon: isPasswordCorrect!
                                  ? Icon(
                                      Icons.verified,
                                      color: Colors.green,
                                    )
                                  : Icon(Icons.close,
                                      color: Colors.red, size: 25)),
                          obscureText: true,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FormField(
                          builder: (state) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  // crossAxisAlignment:CrossAxisAlignment.start,
                                  children: [
                                    Checkbox(

                                      activeColor: Colors.white,
                                        side: BorderSide(
                                          color: Colors.blue,
                                          width: 2
                                        ),
                                        checkColor: Colors.blue,
                                        value: isChecked,
                                        onChanged: (value) {
                                          setState(() {
                                            isChecked = value!;
                                            //  state.didChange(value);
                                          });
                                        }),
                                    RichText(
                                        text: TextSpan(children: [
                                      TextSpan(
                                          style: defaultStyle1,
                                          text:
                                              'j\'ai lu  les conditions et j\'accepte '),
                                      TextSpan(
                                          style: TextStyle(
                                            color: Colors.blue,
                                            decoration:
                                                TextDecoration.underline,
                                            fontSize: 12,
                                            fontFamily: 'Chewy',
                                          ),
                                          text:
                                              'les  conditions\ngénerales d\'utilisations',
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              // Navigator.pushNamed(context, "/email");
                                            }),
                                      TextSpan(
                                          style: defaultStyle1,
                                          text:
                                              ' figurant dans la notice Légal'),
                                    ])),
                                  ],
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  SP.Precedent('/telephone', context),
                  SizedBox(
                    width: 10,
                  ),
                  SP.Suivant(isPasswordCorrect!, isChecked!, Envoyer, context),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
} //TODO
