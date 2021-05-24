import 'package:cobamodul5/ApiFitur3.dart';
import 'package:flutter/material.dart';
import 'package:cobamodul5/mainHome.dart';

class Tenjokes extends StatefulWidget {
  @override
  jokes createState() => jokes();
}

class jokes extends State<Tenjokes> {

  List<Ten> _data;
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    getTenJ();
  }
  Future<void> getTenJ() async {
    _data = await fetchapiTenjokes();
    setState(() {
      _isLoading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          title: Text("Ten Programming Jokes"),
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
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
            itemCount: _data.length,
            itemBuilder: (context, index) {
              final x = _data[index];
              return Container(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // Text(x.id),
                    Text('Type : '+x.type+'\n'),
                    Text('Setup :'+x.setup+'\n'),
                    Text('Punchline : '+x.punchline),
                    Text('--------------------------------------------------------------------------------------------')
                  ],
                ),
              );
            }
        ));
  }
}