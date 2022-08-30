
import 'package:b3g/widgets/Parameteres.dart';
import 'package:flutter/material.dart';

class OuvrirCompte extends StatelessWidget {
  const OuvrirCompte({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        icon: Icon(Icons.arrow_back_ios, color: Colors.blue, size: 20),
                        onPressed: () {
                          Navigator.pushNamed(context, "/myHome");
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(60, 23, 0, 0),
                      child: Image(
                        // color: Colors.red,
                        image: AssetImage('images/B3G.png'),
                        width: 170,
                        fit: BoxFit.contain,
                        height: 80,
                      ),
                    ),
                  ],
                ),



                Image(
                  image: AssetImage('images/CreditCard.jpg'),
                  height: 250,
                  fit: BoxFit.fill,
                  width: 450,
                ),
SizedBox(
  height: 5,
),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 15, 0),
                  child: Text(
                    'Demandez votre carte \nbancaire ',
                    style: TextStyle(
                        color: Color.fromRGBO(0, 57, 91, 1),
                        fontSize: 20,
                        fontFamily: 'ArvoBold'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 15, 0),
                  child: Text(
                    'Directement depuis chez vous',
                    style: TextStyle(fontSize: 22,
                      fontFamily: 'ArvoRegular',
                      color: Color.fromRGBO(0, 57, 91, 1)

                    ),
                  ),
                ),
                SizedBox(
                  height: 105,
                ),



                ...(ParamsHome.ListeO_S as List).map(
                      (item) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(15,0,15,10),
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '${item['route']}');
                            },
                            style: ElevatedButton.styleFrom(
                              side:item['side'],
                              primary: item['couleur'],
                              shape: RoundedRectangleBorder(
                                //to set border radius to button
                                borderRadius: BorderRadius.circular(7),
                              ),

                            ),
                            child: item['title']),
                      ),
                    );
                  },
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
