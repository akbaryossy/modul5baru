import 'dart:convert';
import 'package:http/http.dart' as http;
class Programming {
  // final String id;
  final String type;
  final String setup;
  final String punchline;


  Programming({this.type, this.setup, this.punchline});

  factory Programming.fromJson(dynamic json) {
    return Programming(
      // id: json['id'] as String,
      type: json['type'] as String,
      setup: json['setup'] as String,
      punchline: json['punchline'] as String,
    );
  }

  static List<Programming> apiProgramming(List snapshot) {
    return snapshot.map((data) {
      return Programming.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'nilai {type: $type, setup: $setup, puchline: $punchline}';
  }
}
Future<List<Programming>> fetchapiProgramming() async {
  final response = await http.get(Uri.https('official-joke-api.appspot.com', 'jokes/programming/random'));
  if(response.statusCode == 200){
    final data = jsonDecode(response.body);
    List _temp = [];
    for (var i in data) {
      _temp.add(i);
    }

    return Programming.apiProgramming(_temp);
  }else{
    throw Exception('Api nya Error Bro');
  }
}
