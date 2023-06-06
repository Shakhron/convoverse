import 'package:firebase/features/home/domain/useCases/home_usecase.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: HomeUseCase)
class Homerepository extends HomeUseCase {
  final DatabaseReference _roomsRef = FirebaseDatabase.instance.ref('rooms');
  final DatabaseReference _usersRef = FirebaseDatabase.instance.ref('users');

  @override
  Stream<DatabaseEvent> getChatList(String userID) {
    Query userChatsQuery =
        _roomsRef.orderByChild('authorizedUsers/UIDtest').equalTo(true);
    return userChatsQuery.onValue;
  }

  @override
  Future<Map> getUserInfo(String userID) async {
    DatabaseEvent event = await _usersRef.child(userID).once();
    return event.snapshot.value as Map<dynamic, dynamic>;
  }
}
