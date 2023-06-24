part of 'chat_bloc.dart';

@freezed
class ChatEvent with _$ChatEvent {
  const factory ChatEvent.loadMessage(DatabaseEvent messages) = _LoadMessage;
  const factory ChatEvent.newMessage(List<Message> messages) = _NewMessage;
  const factory ChatEvent.sendMessage(Message message) = _SendMessage;
}
