import 'dart:convert';
import 'package:http/http.dart' as http;
class Ten2 {
  // final String id;
  final String type;
  final String setup;
  final String punchline;

  Ten2({this.type, this.setup, this.punchline});

  factory Ten2.fromJson(dynamic json) {
    return Ten2(
      // id: json['id'] as String,
      type: json['type'] as String,
      setup: json['setup'] as String,
      punchline: json['punchline'] as String,
    );
  }

  static List<Ten2> apiTen(List snapshot) {
    return snapshot.map((data) {
      return Ten2.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'apiTenQuotes { type: $type, setup: $setup, punchline: $punchline}';
  }
}
Future<List<Ten2>> fetchapiTenjokes2() async {
  final response = await http.get(Uri.https('official-joke-api.appspot.com', 'jokes/ten'));
  if(response.statusCode == 200){
    final data = jsonDecode(response.body);
    List _temp = [];
    for (var i in data) {
      _temp.add(i);
    }

    return Ten2.apiTen(_temp);
  }else{
    throw Exception('Api nya Error Bro');
  }
}
