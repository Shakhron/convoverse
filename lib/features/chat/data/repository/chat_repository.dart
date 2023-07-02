import 'package:firebase/features/chat/data/DTO/messageDTO.dart';
import 'package:firebase/features/chat/domain/useCases/chat_usecase.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: ChatUseCase)
class Homerepository extends ChatUseCase {
  final DatabaseReference _messageRef =
      FirebaseDatabase.instance.ref('messages');

  @override
  Stream<DatabaseEvent> getMessage(String roomId) {
    Query chatMessageQuery =
        _messageRef.orderByChild('groupId').equalTo(roomId);
    return chatMessageQuery.onValue;
  }

  @override
  Future sendMessage(MessageDTO messageDTO) async {
    await _messageRef.update(messageDTO.toMap());
  }

  // @override
  // Stream<DatabaseEvent> getMessage(String roomsId) {

  // }
}
