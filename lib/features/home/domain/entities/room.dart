// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:firebase/features/home/data/DTO/roomDTO.dart';
import 'package:firebase/features/home/data/DTO/userDTO.dart';

class Room {
  final String id;
  final String title;
  final String lastMessage;
  final String ts;
  final String type;
  final List<UserDTO> members;
  Room({
    required this.id,
    required this.title,
    required this.lastMessage,
    required this.ts,
    required this.type,
    required this.members,
  });

  factory Room.fromDTO(RoomDTO room, List<UserDTO> members) {
    return Room(
      id: room.id,
      title: room.title,
      lastMessage: room.lastMessage,
      ts: room.ts,
      type: room.type,
      members: members,
    );
  }
}
