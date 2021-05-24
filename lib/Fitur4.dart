import 'package:cobamodul5/ApiFitur4.dart';
import 'package:flutter/material.dart';
import 'package:cobamodul5/mainHome.dart';

class TenJokes2 extends StatefulWidget {
  @override
  jokes createState() => jokes();
}

class jokes extends State<TenJokes2> {

  List<Ten2> _data;
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    getTenQuotes();
  }
  Future<void> getTenQuotes() async {
    _data = await fetchapiTenjokes2();
    setState(() {
      _isLoading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          title: Text("Ten Jokes"),
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