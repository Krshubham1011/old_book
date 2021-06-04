import 'package:carousel_pro/carousel_pro.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:old_book/RegisterScreen.dart';
import 'package:old_book/about.dart';
import 'package:old_book/auth.dart';
import 'package:old_book/buy_old_book.dart';
import 'package:old_book/donate_old_book.dart';
import 'package:old_book/feedback.dart';
import 'package:old_book/home.dart';
import 'package:old_book/sell_old_book.dart';
import 'package:old_book/settings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Old_Book',
        home: (userData() == null) ? RegisterScreen() : MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  List<String> values = [
    "assets/buy.jpeg",
    "assets/sell.jpeg",
    "assets/donate.jpeg",
    "assets/settings.jpeg",
    "assets/about.jpeg",
    "assets/feedback.jpeg"
  ];
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var scaffold = Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Old book"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.message_sharp,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return HomePage();
              }));
            },
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Container(
                child: Text(
                  "More options",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.0,
                  ),
                ),
                alignment: Alignment.bottomCenter, // <-- ALIGNMENT
                height: 50,
              ),
              decoration: BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                      image: AssetImage("assets/drawer.png"),
                      fit: BoxFit.cover)),
            ),
            ListTile(
              title: Text('Log out'),
              onTap: () async {
                await FirebaseAuth.instance.signOut().then((value) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return RegisterScreen();
                  }));
                });
              },
            ),
            ListTile(
              title: Text('About App'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Share App'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: WillPopScope(
        onWillPop: () {
          SystemNavigator.pop();
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
          child: SingleChildScrollView(
              child: Column(
            children: [
              Container(
                height: _height,
                child: GridView.builder(
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    print(index);
                    return InkWell(
                      onTap: () {
                        if (index == 0) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Buyoldbook()),
                          );
                        }
                        if (index == 1) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Selloldbook()),
                          );
                        }
                        if (index == 2) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Donateoldbook()),
                          );
                        }
                        if (index == 3) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Settings()),
                          );
                        }
                        if (index == 4) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => About()),
                          );
                        }
                        if (index == 5) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Feedback()),
                          );
                        }
                      },
                      child: Card(
                        elevation: 10,
                        child: Image.asset(
                          values[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: Container(
                  height: 100,
                  width: double.infinity,
                  child: Carousel(
                    autoplay: true,
                    overlayShadowSize: 0.1,
                    showIndicator: false,
                    boxFit: BoxFit.fill,
                    images: [
                      Image.asset(
                        "assets/4.jpg",
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        "assets/5.png",
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        "assets/6.jpg",
                        fit: BoxFit.cover,
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
        ),
      ),
    );
    return scaffold;
  }
}
