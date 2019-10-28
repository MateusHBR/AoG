import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alcool ou Gasolina',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Theme.of(context).primaryColor, // utilizar a cor primaria
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 60,
          ),
          Image.asset(
            "assets/images/aog-white.png",
            height: 80,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Álcool ou Gasolina",
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontFamily: "Big Shoulders Display",
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
