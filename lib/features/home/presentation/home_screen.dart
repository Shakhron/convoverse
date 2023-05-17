import 'package:firebase/features/home/presentation/widgets/app_bar_widget.dart';
import 'package:firebase/features/home/presentation/widgets/chat_card_widget.dart';
import 'package:firebase/features/home/presentation/widgets/search_field_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const AppBarWidget(title: 'Chats', imageUrl: 'imageUrl'),
          SliverAppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            title: const SearchFieldWidget(),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (_, int index) {
              return const ChatCardWidget(
                  name: 'User', imageUrl: '', message: 'some message');
            },
            childCount: 30,
          )),
        ],
      ),
    );
  }
}
