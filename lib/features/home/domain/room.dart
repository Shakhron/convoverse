// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Room {
  final String title;
  final String lastMessage;
  final String ts;
  Room({
    required this.title,
    required this.lastMessage,
    required this.ts,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'lastMessage': lastMessage,
      'ts': ts,
    };
  }

  factory Room.fromMap(Map<dynamic, dynamic> map) {
    return Room(
      title: map['title'] as String,
      lastMessage: map['lastMessage'] as String,
      ts: map['ts'] as String,
    );
  }

  // String toJson() => json.encode(toMap());

  // factory Room.fromJson(String source) =>
  //     Room.fromMap(json.decode(source) as Map<String, dynamic>);
}
