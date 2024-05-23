import 'package:hive/hive.dart';


abstract class LocalDataSource {
  Future<void> saveSessionId(String sessionId);

  Future<String?> getSessionId();

  Future<void> deleteSessionId();
}

class LocalDataSourceImpl extends LocalDataSource {
  final key = "session_id";

  @override
  Future<void> deleteSessionId() async {
    final authenticationBox = await Hive.openBox('authenticationBox');
    authenticationBox.delete(key);
  }

  @override
  Future<String?> getSessionId() async {
    final authenticationBox = await Hive.openBox('authenticationBox');
    return await authenticationBox.get(key);
  }

  @override
  Future<void> saveSessionId(String sessionId) async {
    final authenticationBox = await Hive.openBox('authenticationBox');
    return await authenticationBox.put(key, sessionId);
  }
}
