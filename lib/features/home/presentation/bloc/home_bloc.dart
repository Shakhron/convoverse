import 'package:firebase/features/home/domain/room.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final String uid;
  final ref = FirebaseDatabase.instance.ref();

  HomeBloc({required this.uid}) : super(const _Loading()) {
    on<_Init>((event, emit) async {
      List<Room> rooms = [];
      DatabaseReference roomsRef = FirebaseDatabase.instance.ref('rooms');
      Query userChatsQuery =
          roomsRef.orderByChild('authorizedUsers/UIDtest').equalTo(true);
      userChatsQuery.onValue.listen((DatabaseEvent event) {
        if (event.snapshot.value != null) {
          final roomsMap = event.snapshot.value as Map<dynamic, dynamic>;
          roomsMap.forEach((key, value) {
            rooms.add(Room.fromMap(value));
          });
          add(_$_NewRoom(rooms));
        } else {
          // Нет доступных чатов
        }
      });
      print(rooms.length);
    });
    on<_NewRoom>((event, emit) {
      emit(_$_Loaded(event.room));
    });
  }
}
