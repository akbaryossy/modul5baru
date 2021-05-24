import 'package:cobamodul5/ApiFitur1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cobamodul5/mainHome.dart';
// import 'package:fianpakeapi/api/apiQuotesRandom.dart';

// import '../main.dart';
class jokesRandom extends StatefulWidget {
  @override
  _jokesRandomState createState() => _jokesRandomState();
}

class _jokesRandomState extends State<jokesRandom> {
  Future<Resep> futureGetRandomJokes;
  @override
  void initState() {
    super.initState();
    futureGetRandomJokes = fetchResep();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        title: Text("Jokes Random"),
        backgroundColor: Colors.brown,
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){
              Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => MyApp()));
            });
          },
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              child:
              Image.asset('assets/image/ketawa.png',
                width: 160,
                height: 160,
              ),
            ),
            FutureBuilder<Resep> (
                future: futureGetRandomJokes,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting){
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError){
                    return Text ("${snapshot.error}");
                  } else {
                    return Column(
                      children : [

                        // Text(snapshot.data.id.toString()),
                        // Text(snapshot.data.number.toString()),
                        // Text(snapshot.data.numApIs.toString()),
                        // Text(snapshot.data.numEndpoints.toString()),
                        // Text(snapshot.data.numSpecs.toString()),
                        // Text("id : " +snapshot.data.id.toString()),
                        Text("Type : "+snapshot.data.type),
                        Text("Setup : "+snapshot.data.setup),
                        Text("Puchline : "+snapshot.data.punchline),
                        // Text(snapshot.data.sectEng),
                        // Text(snapshot.data.chapgrpEng),
                        // Text(snapshot.data.chapEng),
                        // Text(snapshot.data.eng),
                        // Text(snapshot.data.engExp),
                        // Text(snapshot.data.arti.toString()),

                      ],

                    );
                  }
                }
            ),
            SizedBox(
              height: 24,
            ),
            ElevatedButton(
              onPressed: (){
                setState((){
                  futureGetRandomJokes = fetchResep();
                });
              },
              child: Text("Random Joke"),
            )
          ],
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){
      //     futureGetRandomJokes = fetchResep();
      //   },
      //   child: Icon(Icons.navigate_next),
      //
      // ),
    );
  }
}