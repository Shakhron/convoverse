import 'package:firebase/features/chat/data/DTO/messageDTO.dart';
import 'package:firebase_database/firebase_database.dart';

abstract class ChatUseCase {
  Stream<DatabaseEvent> getMessage(String roomsId);
  Future sendMessage(MessageDTO messageDTO);
}
