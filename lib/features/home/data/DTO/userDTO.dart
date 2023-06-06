import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserDTO {
  final String name;
  final String avatarURL;
  UserDTO({
    required this.name,
    required this.avatarURL,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'avatarURL': avatarURL,
    };
  }

  factory UserDTO.fromMap(Map<dynamic, dynamic> map) {
    return UserDTO(
      name: map['name'] as String,
      avatarURL: map['avatarURL'] as String,
    );
  }
}
