// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Contact {
  final String avatarURL;
  final String name;
  final String rooms;
  Contact({
    required this.avatarURL,
    required this.name,
    required this.rooms,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'avatarURL': avatarURL,
      'name': name,
      'rooms': rooms,
    };
  }

  factory Contact.fromMap(Map<dynamic, dynamic> map) {
    return Contact(
      avatarURL: map['avatarURL'] as String,
      name: map['name'] as String,
      rooms: map['rooms'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  // factory Contact.fromJson(String source) =>
  //     Contact.fromMap(json.decode(source) as Map<String, dynamic>);
}
