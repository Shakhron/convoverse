import 'package:firebase/features/home/presentation/widgets/chat_list_widget.dart';
import 'package:firebase/features/home/presentation/widgets/loading_widget.dart';
import 'package:firebase/features/home/presentation/bloc/home_bloc.dart';
import 'package:firebase/features/home/presentation/widgets/app_bar_widget.dart';
import 'package:firebase/features/home/presentation/widgets/empty_list_widgets.dart';
import 'package:firebase/features/home/presentation/widgets/search_field_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              AppBarWidget(
                  title: 'Chats',
                  imageUrl: FirebaseAuth.instance.currentUser?.photoURL),
              const SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                sliver: SliverToBoxAdapter(
                  child: SearchFieldWidget(),
                ),
              ),
              state.when(
                empty: () => const EmptyListWidget(),
                loading: () => const LoadingWidget(),
                loaded: () => const ChatListWidget(),
                error: (error) => ErrorWidget(error),
              ),
            ],
          ),
        );
      },
    );
  }
}
