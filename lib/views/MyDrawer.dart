import 'package:b3g/widgets/ParamDrawer.dart';
import 'package:flutter/material.dart';


class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        width: MediaQuery.of(context).size.width / 1.13,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 40,
            leading: Container(),
            /*  actions: <Widget>[
           new IconButton(
             icon: new Icon(Icons.close),
             onPressed: () => Navigator.of(context).pop(null),
           ),
         ],*/
            iconTheme: IconThemeData(color: Colors.blue),
            flexibleSpace: Padding(
              padding: const EdgeInsets.fromLTRB(0, 3, 0, 3),
              child: Container(
                width: 20,
                height: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/logo.jpg'),
                    //fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            bottom: PreferredSize(
              child: Container(
                color: Colors.orange,
                height: 2,
              ),
              preferredSize: Size.fromHeight(10),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Text('Srevices CIH BANK Mobile',
                    style: TextStyle(
                        fontSize: 21,
                        color: Colors.orange,
                        fontFamily: 'Alfa')),
                //  SizedBox(height: 20,),

                ...(GlobalParams.Liste1 as List).map(
                  (item) {
                    return ListTile(
                      title: item['title'],
                      leading: item['icon'],
                      onTap: () {
                        Navigator.pushNamed(context, '${item['route']}');
                      },
                    );
                  },
                ),
                SizedBox(
                  height: 50,
                ),

                ...(GlobalParams.Liste2 as List).map(
                  (item) {
                    return SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '${item['route']}');
                          },
                          style: ElevatedButton.styleFrom(
                            side:item['side'],
                            primary: item['couleur'],
                            shape: RoundedRectangleBorder(
                              //to set border radius to button
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: item['title']),
                    );
                  },
                ),



              ],
            ),
          ),
        ));
  }
}
