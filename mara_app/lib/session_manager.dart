import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  static const String _sessionKey = 'user_sessions';

  static Future<void> startNewSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String newSessionId = DateTime.now().toIso8601String();
    List<String> sessions = prefs.getStringList(_sessionKey) ?? [];
    sessions.add(newSessionId);
    await prefs.setStringList(_sessionKey, sessions);
    await prefs.setString('current_session', newSessionId);
  }

  static Future<void> endCurrentSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? currentSession = prefs.getString('current_session');
    if (currentSession != null) {
      String endTimeKey = '$currentSession-end';
      await prefs.setString(endTimeKey, DateTime.now().toIso8601String());
      await prefs.remove('current_session');
    }
  }

  static Future<void> logScreenEntry(String screenName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? currentSession = prefs.getString('current_session');
    if (currentSession != null) {
      String entryTimeKey = '$currentSession-$screenName-entry';
      await prefs.setString(entryTimeKey, DateTime.now().toIso8601String());
    }
  }

  static Future<void> logScreenExit(String screenName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? currentSession = prefs.getString('current_session');
    if (currentSession != null) {
      String exitTimeKey = '$currentSession-$screenName-exit';
      String durationKey = '$currentSession-$screenName-duration';
      String? entryTime = prefs.getString('$currentSession-$screenName-entry');
      if (entryTime != null) {
        DateTime entryDateTime = DateTime.parse(entryTime);
        int duration = DateTime.now().difference(entryDateTime).inSeconds;
        await prefs.setString(exitTimeKey, DateTime.now().toIso8601String());
        await prefs.setInt(durationKey, duration);
      }
    }
  }

  static Future<void> logQuizChoice(String screenName, String questionKey, String optionKey, String language) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? currentSession = prefs.getString('current_session');
    if (currentSession != null) {
      String choiceKey = '$currentSession-$screenName-quiz-$questionKey';
      await prefs.setString(choiceKey, '$optionKey ($language)');
    }
  }
}
