import 'dart:convert';
import 'package:http/http.dart' as http;
// import 'package:meta/meta.dart';
// To parse this JSON data, do
//
//     final resep = resepFromJson(jsonString);

Resep resepFromJson(String str) => Resep.fromJson(json.decode(str));

String resepToJson(Resep data) => json.encode(data.toJson());

class Resep {
  Resep({
    this.id,
    this.type,
    this.setup,
    this.punchline,
  });

  int id;
  String type;
  String setup;
  String punchline;

  factory Resep.fromJson(Map<String, dynamic> json) => Resep(
    id: json["id"],
    type: json["type"],
    setup: json["setup"],
    punchline: json["punchline"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "setup": setup,
    "punchline": punchline,
  };
}

Future<Resep> fetchResep() async {
  final response = await http.get(Uri.https('official-joke-api.appspot.com', 'random_joke'));
  if (response.statusCode == 200) {
    return Resep.fromJson(jsonDecode(response.body));
  }else {
    throw Exception('Api nya Error Bro');
  }
}