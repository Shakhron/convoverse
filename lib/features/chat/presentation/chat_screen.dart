import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase/core/widgets/empty_list_widget.dart';
import 'package:firebase/core/widgets/loading_widget.dart';
import 'package:firebase/features/chat/domain/entities/message.dart';
import 'package:firebase/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:firebase/features/chat/presentation/widgets/massages_list_widget.dart';
import 'package:firebase/features/home/domain/entities/room.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key, required this.room});
  final Room room;
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                room.members.first.avatarURL.isEmpty
                    ? const SizedBox(
                        height: 50,
                        width: 50,
                        child: CircleAvatar(
                          backgroundImage: AssetImage('images/user.png'),
                        ),
                      )
                    : SizedBox(
                        height: 50,
                        width: 50,
                        child: CircleAvatar(
                          backgroundImage: CachedNetworkImageProvider(
                              room.members.first.avatarURL),
                        ),
                      ),
                Text(
                  room.members.first.name,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(),
              ],
            ),
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios)),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.video_call)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
            ],
          ),
          body: state.when(
              loading: () => const LoadingWidget(),
              loaded: (messages) => MessageListWidget(messages: messages),
              error: () => Container(),
              empty: () => const EmptyListWidget()),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Container(
            decoration: BoxDecoration(
              border:
                  const Border(top: BorderSide(width: 1, color: Colors.grey)),
              color: Theme.of(context).appBarTheme.backgroundColor,
            ),
            height: 78,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                      height: 42,
                      child: TextFormField(
                        controller: messageController,
                        onChanged: (value) {
                          value.isNotEmpty
                              ? context.read<ChatBloc>().isTyping = true
                              : context.read<ChatBloc>().isTyping = false;
                        },
                        onTapOutside: (event) =>
                            FocusManager.instance.primaryFocus?.unfocus(),
                      )),
                ),
                IconButton(
                    onPressed: () {
                      print(room.id);
                      context
                          .read<ChatBloc>()
                          .add(ChatEvent.sendMessage(Message(
                            id: DateTime.now()
                                .microsecondsSinceEpoch
                                .toString(),
                            content: messageController.text,
                            readed: false,
                            senderId: 'UIDtest',
                            type: 'text',
                            ts: DateTime.now().toString(),
                            groupId: room.id,
                          )));
                      messageController.clear();
                    },
                    icon: const Icon(Icons.send))
                // context.read<ChatBloc>().isTyping
                //     ? IconButton(onPressed: () {}, icon: const Icon(Icons.send))
                //     : Row(
                //         children: [
                //           IconButton(
                //             onPressed: () {},
                //             icon: const Icon(Icons.camera_alt_outlined),
                //           ),
                //           IconButton(
                //             onPressed: () {},
                //             icon: const Icon(Icons.mic_outlined),
                //           )
                //         ],
                //       ),
              ],
            ),
          ),
        );
      },
    );
  }
}
