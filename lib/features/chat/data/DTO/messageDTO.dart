class MessageDTO {
  final String id;
  final String content;
  final bool readed;
  final String senderId;
  final String type;
  final String ts;
  final String groupId;
  MessageDTO({
    required this.id,
    required this.content,
    required this.readed,
    required this.senderId,
    required this.type,
    required this.ts,
    required this.groupId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      id: {
        'id': id,
        'content': content,
        'readed': readed,
        'senderId': senderId,
        'type': type,
        'ts': ts,
        'groupId': groupId
      }
    };
  }

  factory MessageDTO.fromMap(Map<dynamic, dynamic> map) {
    return MessageDTO(
      id: map['id'] as String,
      content: map['content'] as String,
      readed: map['readed'] as bool,
      senderId: map['senderId'] as String,
      type: map['type'] as String,
      ts: map['ts'] as String,
      groupId: map['groupId'] as String,
    );
  }
}
