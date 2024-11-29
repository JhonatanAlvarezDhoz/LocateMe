import 'package:isar/isar.dart';
import 'package:locate_me/modules/user/data/models/session/session.dart';

class SessionRepository {
  final Isar isar;

  SessionRepository({required this.isar});

  Future<bool> createSessionr(Session session) async {
    return await isar.writeTxn(() async {
      final created = await isar.sessions.put(session);
      if (created <= 0) {
        return false;
      }
      return true;
    });
  }

  Future<Session?> getSesion() async {
    return await isar.sessions.where().findFirst();
  }

  Future<bool> deleteSession(int sessionId) async {
    return await isar.writeTxn(() async {
      final deleted = await isar.sessions.delete(sessionId);
      if (!deleted) {
        return false;
      }
      return deleted;
    });
  }
}
