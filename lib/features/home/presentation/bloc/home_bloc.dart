import 'dart:async';

import 'package:firebase/features/home/data/DTO/roomDTO.dart';
import 'package:firebase/features/home/data/DTO/userDTO.dart';
import 'package:firebase/features/home/domain/entities/room.dart';
import 'package:firebase/features/home/domain/useCases/home_usecase.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final String uid;
  final HomeUseCase repo;
  late StreamSubscription<DatabaseEvent> chatListSubscription;
  List<Room> rooms = [];

  HomeBloc({required this.uid, required this.repo}) : super(const _Loading()) {
    chatListSubscription = repo.getChatList(uid).listen((event) {
      add(_$_CreateRoom(event));
    });
    on<_NewRoom>((event, emit) {
      emit(const _$_Loaded());
    });
    on<_CreateRoom>((event, emit) {
      if (event.event.snapshot.value != null) {
        final roomsMap = event.event.snapshot.value as Map<dynamic, dynamic>;
        roomsMap.forEach((key, value) async {
          RoomDTO room = RoomDTO.fromMap(value);
          List<UserDTO> users = [];
          Map<dynamic, dynamic> members = room.authorizedUsers;
          List membersIDs = members.keys.toList();
          for (var memberID in membersIDs) {
            if (memberID != 'UIDtest') {
              Map<dynamic, dynamic> userInfo = await repo.getUserInfo(memberID);
              UserDTO user = UserDTO.fromMap(userInfo);
              users.add(user);
            }
          }

          rooms.add(Room.fromDTO(room, users));
          add(const _$_NewRoom());
        });
      } else {
        emit(const _$_Empty());
      }
    });
  }
}
