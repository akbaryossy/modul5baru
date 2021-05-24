import 'dart:convert';
import 'package:http/http.dart' as http;
class Ten {
  // final String id;
  final String type;
  final String setup;
  final String punchline;


  Ten({this.type, this.setup, this.punchline});

  factory Ten.fromJson(dynamic json) {
    return Ten(
      // id: json['id'] as String,
      type: json['type'] as String,
      setup: json['setup'] as String,
      punchline: json['punchline'] as String,
    );
  }

  static List<Ten> apiTen(List snapshot) {
    return snapshot.map((data) {
      return Ten.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'apiTenQuotes {setup: $setup, punchline: $punchline}';
  }
}
Future<List<Ten>> fetchapiTenjokes() async {
  final response = await http.get(Uri.https('official-joke-api.appspot.com', 'jokes/programming/ten'));
  if(response.statusCode == 200){
    final data = jsonDecode(response.body);
    List _temp = [];
    for (var i in data) {
      _temp.add(i);
    }

    return Ten.apiTen(_temp);
  }else{
    throw Exception('Api nya Error Bro');
  }
}
