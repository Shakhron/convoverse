import 'dart:async';

import 'package:firebase/features/chat/data/DTO/messageDTO.dart';
import 'package:firebase/features/chat/data/message_mapper.dart';
import 'package:firebase/features/chat/domain/entities/message.dart';
import 'package:firebase/features/chat/domain/useCases/chat_usecase.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_event.dart';
part 'chat_state.dart';
part 'chat_bloc.freezed.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatUseCase repo;
  late StreamSubscription<DatabaseEvent> messageListSubscription;
  List<Message> messages = [];
  bool isTyping = false;

  ChatBloc(this.repo) : super(const _Loading()) {
    messageListSubscription = repo.getMessage('roomIdtest').listen((event) {
      add(_LoadMessage(event));
      messageListSubscription.pause();
    });

    on<_NewMessage>((event, emit) => emit(ChatState.loaded(event.messages)));
    on<_LoadMessage>((event, emit) {
      if (event.messages.snapshot.value != null) {
        final messagesMap =
            event.messages.snapshot.value as Map<dynamic, dynamic>;
        messagesMap.forEach((key, value) {
          MessageDTO message = MessageDTO.fromMap(value);
          messages.add(MessageMapper.fromDTO(message));
          add(ChatEvent.newMessage(messages));
        });
      } else {
        emit(const _$_Empty());
      }
    });
    on<_SendMessage>((event, emit) {
      try {
        repo.sendMessage(MessageMapper.toDTO(event.message));
      } catch (e) {
        print(e.toString());
      }
      messageListSubscription.resume();
    });
  }
  @override
  Future<void> close() {
    messageListSubscription.cancel();
    return super.close();
  }
}
