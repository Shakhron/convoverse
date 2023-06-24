import 'package:firebase/features/chat/data/DTO/messageDTO.dart';
import 'package:firebase/features/chat/domain/entities/message.dart';

class MessageMapper {
  static Message fromDTO(MessageDTO messageDTO) {
    return Message(
      id: messageDTO.id,
      content: messageDTO.content,
      readed: messageDTO.readed,
      senderId: messageDTO.senderId,
      type: messageDTO.type,
      ts: messageDTO.ts,
      groupId: messageDTO.groupId,
    );
  }

  static MessageDTO toDTO(Message message) {
    return MessageDTO(
      id: message.id,
      content: message.content,
      readed: message.readed,
      senderId: message.senderId,
      type: message.type,
      ts: message.ts,
      groupId: message.groupId,
    );
  }
}
