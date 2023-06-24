import 'package:firebase/core/di/init_di.dart';
import 'package:firebase/features/chat/domain/useCases/chat_usecase.dart';
import 'package:firebase/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:firebase/features/chat/presentation/chat_screen.dart';
import 'package:firebase/features/home/domain/entities/room.dart';
import 'package:firebase/features/home/presentation/widgets/chat_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatListWidget extends StatelessWidget {
  final List<Room> rooms;
  const ChatListWidget({super.key, required this.rooms});

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
      (_, int index) {
        return GestureDetector(
          onTap: () =>
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return BlocProvider(
              create: (context) => ChatBloc(locator.get<ChatUseCase>()),
              child: ChatScreen(room: rooms[index]),
            );
          })),
          child: ChatCardWidget(
              name: rooms[index].members[0].name,
              imageUrl: rooms[index].members[0].avatarURL,
              message: rooms[index].lastMessage),
        );
      },
      childCount: rooms.length,
    ));
  }
}
