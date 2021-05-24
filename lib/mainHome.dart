import 'package:cobamodul5/Fitur2.dart';
import 'package:cobamodul5/Fitur4.dart';
import 'package:flutter/material.dart';
import 'package:cobamodul5/Fitur1.dart';
import 'package:cobamodul5/Fitur3.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   primarySwatch: Colors.red,
      // ),
      home: MyHomePage(title: 'General and Programming Jokes'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  void _incrementCounter() {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child:
              Image.asset('assets/image/a.jpg',
                width: 160,
                height: 160,
              ),
            ),

            RaisedButton(
              onPressed: (){
                Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => jokesRandom()));},
              child: Text('Random Joke'),
            ),
            RaisedButton(
              onPressed: (){
                Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => programming()));},
              child: Text('Programming Random Jokes'),
            ),
            RaisedButton(
              onPressed: (){
                Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => Tenjokes()));},
              child: Text('Ten Programming Joke'),
            ),
            RaisedButton(
              onPressed: (){
                Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => TenJokes2()));},
              child: Text('Ten Joke'),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
