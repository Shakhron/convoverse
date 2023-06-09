part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.newRoom(List<Room> rooms) = _NewRoom;
  const factory HomeEvent.createRoom(DatabaseEvent event) = _CreateRoom;
}
