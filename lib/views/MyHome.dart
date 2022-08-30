import 'package:b3g/widgets/Parameteres.dart';
import 'package:flutter/material.dart';
import 'MyDrawer.dart';

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: MyDrawer(),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          toolbarHeight: 40,
          iconTheme: IconThemeData(color: Colors.blue),
          flexibleSpace: Padding(
            padding: const EdgeInsets.fromLTRB(0,3,0,3),
            child: Container(
              decoration: BoxDecoration(

                image: DecorationImage(
                  image: AssetImage('images/B3G.png'),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: PreferredSize(
            child: Container(
              color: Colors.orange,
              height: 2,
            ),
            preferredSize: Size.fromHeight(10),
          ),
        ),
        body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                opacity: 2,
                image: AssetImage("images/bgImage.jpg"),
                fit: BoxFit.cover),
          ),
          child: SingleChildScrollView(
            child: SafeArea(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 250,
                    ),
                    //text1
                    Text(
                      'bienvenue chez',
                      style: TextStyle(
                        fontSize: 40,
                        fontFamily: 'Chewy',
                      ),
                    ),
                    //text2
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'B3G',
                      style: TextStyle(
                        fontSize: 50,
                        fontFamily: 'Alfa',
                      ),
                    ),
                    ...(ParamsHome.Liste as List).map(
                      (item) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, '${item['route']}');
                                },
                                style: ElevatedButton.styleFrom(
                                  side: item['side'],
                                  primary: item['couleur'],
                                  shape: RoundedRectangleBorder(
                                    //to set border radius to button
                                    borderRadius: BorderRadius.circular(30),
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
        ),
      ),
    );
  }
}
