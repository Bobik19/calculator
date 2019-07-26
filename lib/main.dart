import 'package:flutter/material.dart';
import "dart:math";

double buttonTextSize = 30;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  String n1 = "", n2 = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded (child: Container (
                color: Colors.lightBlue,
             child:Row(
            children: <Widget>[
              Spacer(),
              Flexible(
                flex: 3,
                child: TextField(
                  onChanged: (String str) {
                    n1 = str;
                  },
                ),
              ),
              Spacer(),
              Flexible(
                flex: 3,
                child: TextField(
                  onChanged: (String str) {
                    n2 = str;
                  },
                ),
              ),
              Spacer(),
            ],
          ),
         child:Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text(
                  "+",
                  style: TextStyle(fontSize: buttonTextSize),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EndPage(
                              n1: this.n1, n2: this.n2, act: 0)));
                },
              ),
              FlatButton(
                child: Text(
                  "-",
                  style: TextStyle(fontSize: buttonTextSize),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EndPage(
                              n1: this.n1, n2: this.n2, act: 1)));
                },
              ),
              FlatButton(
                child: Text(
                  "*",
                  style: TextStyle(fontSize: buttonTextSize),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EndPage(
                              n1: this.n1, n2: this.n2, act: 2)));
                },
              ),
              FlatButton(
                child: Text(
                  "/",
                  style: TextStyle(fontSize: buttonTextSize),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EndPage(
                              n1: this.n1, n2: this.n2, act: 3)));
                },
              ),
              FlatButton(
                child: Text(
                  "^",
                  style: TextStyle(fontSize: buttonTextSize),
                ),
                onPressed: () {
                  
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EndPage(
                              n1: this.n1, n2: this.n2, act: 4)));
                },
              ),
            ],
          ),
          ),
          ),
        ],
      ),
    );
  }
}

class EndPage extends StatefulWidget {
  final String n1, n2;
  final int act;
  String printString;
  @override
  EndPage({this.n1, this.n2, this.act}) {
    double n;
    String s;
    int p = this.act;

    switch (p) {
      case 0:
        n = double.parse(this.n1) + double.parse(this.n2);
        s = "+";
        break;
      case 1:
        n = double.parse(this.n1) - double.parse(this.n2);
        s = "-";
        break;
      case 2:
        n = double.parse(this.n1) * double.parse(this.n2);
        s = "*";
        break;
      case 3:
        n = double.parse(this.n1) / double.parse(this.n2);
        s = "/";
        break;
      case 4:
        n = pow(double.parse(this.n1), double.parse(this.n2));
        s = "^";
        break;
    }
    printString = this.n1+" " + s+" " + this.n2 +" "+ "="+" " + n.toString();
  }
  _EndPageState createState() => _EndPageState();
}

class _EndPageState extends State<EndPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
         
            children: <Widget>[
              Expanded (child: Container(
                color: Colors.lightBlue,
             child:Row(
            children: <Widget>[
              Text(
                this.widget.printString,
                style: TextStyle(fontSize: 80),
              )
            ],
          ), 
              ),)
         
        ]));
  }
}