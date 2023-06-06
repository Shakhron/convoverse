import 'package:firebase/features/home/presentation/bloc/home_bloc.dart';
import 'package:firebase/features/home/presentation/widgets/chat_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatListWidget extends StatelessWidget {
  const ChatListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
      (_, int index) {
        return ChatCardWidget(
            name: context.read<HomeBloc>().rooms[index].members[0].name,
            imageUrl:
                context.read<HomeBloc>().rooms[index].members[0].avatarURL,
            message: context.read<HomeBloc>().rooms[index].lastMessage);
      },
      childCount: context.read<HomeBloc>().rooms.length,
    ));
  }
}
