class Message {
  final String id;
  final String content;
  final bool readed;
  final String senderId;
  final String type;
  final String ts;
  final String groupId;
  Message({
    required this.id,
    required this.content,
    required this.readed,
    required this.senderId,
    required this.type,
    required this.ts,
    required this.groupId,
  });
}
