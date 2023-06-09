class RoomDTO {
  final String id;
  final String title;
  final String lastMessage;
  final String ts;
  final String type;
  final Map<dynamic, dynamic> authorizedUsers;
  RoomDTO({
    required this.id,
    required this.title,
    required this.lastMessage,
    required this.ts,
    required this.type,
    required this.authorizedUsers,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'lastMessage': lastMessage,
      'ts': ts,
      'type': type,
      'authorizedUsers': authorizedUsers,
    };
  }

  factory RoomDTO.fromMap(Map<dynamic, dynamic> map) {
    return RoomDTO(
        id: map['id'] as String,
        title: map['title'] as String,
        lastMessage: map['lastMessage'] as String,
        ts: map['ts'] as String,
        type: map['type'] as String,
        authorizedUsers: Map<dynamic, dynamic>.from(
          (map['authorizedUsers'] as Map<dynamic, dynamic>),
        ));
  }
}
