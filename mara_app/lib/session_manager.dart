import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class SessionManager {
  static const String _sessionKey = 'user_sessions';
  static const String _currentSessionKey = 'current_session';

  static Future<String> startNewSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String newSessionId = DateTime.now().toIso8601String();
    List<String> sessions = prefs.getStringList(_sessionKey) ?? [];
    sessions.add(newSessionId);
    await prefs.setStringList(_sessionKey, sessions);
    await prefs.setString(_currentSessionKey, newSessionId);
    return newSessionId;
  }

  static Future<void> endCurrentSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? currentSession = prefs.getString(_currentSessionKey);
    if (currentSession != null) {
      String endTimeKey = '$currentSession-end';
      await prefs.setString(endTimeKey, DateTime.now().toIso8601String());
      await exportData(currentSession); // Automatically export data when the session ends
      await prefs.remove(_currentSessionKey);
    }
  }

  static Future<void> logScreenEntry(String screenName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? currentSession = prefs.getString(_currentSessionKey);
    if (currentSession != null) {
      String entryTimeKey = '$currentSession-$screenName-entry';
      String entryTime = DateTime.now().toIso8601String();
      await prefs.setString(entryTimeKey, entryTime);
      debugPrint('Logged Screen Entry: $screenName at $entryTime');
    }
  }

  static Future<void> logScreenExit(String screenName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? currentSession = prefs.getString(_currentSessionKey);
    if (currentSession != null) {
      String exitTimeKey = '$currentSession-$screenName-exit';
      DateTime exitTime = DateTime.now();
      String durationKey = '$currentSession-$screenName-duration';
      String? entryTime = prefs.getString('$currentSession-$screenName-entry');
      if (entryTime != null) {
        DateTime entryDateTime = DateTime.parse(entryTime);
        int duration = exitTime.difference(entryDateTime).inSeconds;
        await prefs.setString(exitTimeKey, exitTime.toIso8601String());
        await prefs.setInt(durationKey, duration);
        debugPrint('Logged Screen Exit: $screenName at ${exitTime.toIso8601String()} Duration: $duration seconds');
      }
    }
  }

  static Future<void> logQuizChoice(String screenName, String questionKey, String optionKey, String language) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? currentSession = prefs.getString(_currentSessionKey);
    if (currentSession != null) {
      String choiceKey = '$currentSession-$screenName-quiz-$questionKey';
      String choiceValue = '$optionKey ($language)';
      await prefs.setString(choiceKey, choiceValue);
      debugPrint('Logged Quiz Choice: Screen - $screenName, Question - $questionKey, Option - $optionKey, Language - $language');
    }
  }

  static Future<void> logVideoStart(String videoName, DateTime startTime) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? currentSession = prefs.getString(_currentSessionKey);
    if (currentSession != null) {
      String startTimeKey = '$currentSession-video-$videoName-start';
      await prefs.setString(startTimeKey, startTime.toIso8601String());
    }
  }

  static Future<void> logVideoStop(String videoName, DateTime endTime, int duration) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? currentSession = prefs.getString(_currentSessionKey);
    if (currentSession != null) {
      String endTimeKey = '$currentSession-video-$videoName-end';
      String durationKey = '$currentSession-video-$videoName-duration';
      await prefs.setString(endTimeKey, endTime.toIso8601String());
      await prefs.setInt(durationKey, duration);
    }
  }

  static Future<void> exportData(String sessionId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> sessionData = prefs.getKeys().fold<Map<String, dynamic>>({}, (Map<String, dynamic> map, String key) {
      if (key.startsWith(sessionId)) {
        map[key] = prefs.get(key);
      }
      return map;
    });

    String csvData = sessionData.entries.map((e) => '${e.key},${e.value}').join('\n');

    Directory? directory = await getExternalStorageDirectory();
    if (directory == null) {
      throw Exception("Could not access the external storage directory.");
    }

    String path = "${directory.path}/Documents/session_data_$sessionId.csv";
    
    // If the Documents directory does not exist, create it
    Directory documentsDir = Directory("${directory.path}/Documents");
    if (!documentsDir.existsSync()) {
      documentsDir.createSync(recursive: true);
    }

    File file = File(path);
    await file.writeAsString(csvData);
  }
}
