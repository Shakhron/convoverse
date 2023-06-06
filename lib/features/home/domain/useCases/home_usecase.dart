import 'package:firebase_database/firebase_database.dart';

abstract class HomeUseCase {
  Stream<DatabaseEvent> getChatList(String userID);
  Future<Map<dynamic, dynamic>> getUserInfo(String userID);
}
