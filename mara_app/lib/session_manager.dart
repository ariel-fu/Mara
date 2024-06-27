import 'package:mara_app/participantID.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class SessionManager {

  static const String _sessionKey = 'user_sessions';
  static const String _currentSessionKey = 'current_session';
  static int entryVisitCount = 0; //keep track of how many times a page is visited
  static int exitVisitCount = 0;

  static Future<void> logEvent(String eventName, String details) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? currentSession = prefs.getString('current_session');
    if (currentSession != null) {
      String eventKey = '$currentSession-$eventName';
      String eventData = '${DateTime.now().toIso8601String()} - $details';
      await prefs.setString(eventKey, eventData);
      // print(eventData);
    }
  }

 static Future<String> startNewSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String newSessionId = DateTime.now().toIso8601String();
    List<String> sessions = prefs.getStringList(_sessionKey) ?? [];
    String startTimeKey = '$newSessionId-start';
    sessions.add(newSessionId);
    await prefs.setStringList(_sessionKey, sessions);
    await prefs.setString(_currentSessionKey, startTimeKey);
    await prefs.setString(_currentSessionKey, newSessionId);
    return newSessionId;
  }

  static Future<void> logScreenEntry(String screenName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? currentSession = prefs.getString(_currentSessionKey);
    // int visitCount = 0;
    if (currentSession != null) {
      String entryTimeKey = '$currentSession-$screenName-$entryVisitCount-entry';
      List<String> entryTimes = prefs.getStringList(entryTimeKey) ?? [];
      entryTimes.add(DateTime.now().toIso8601String());
      if (prefs.getStringList(entryTimeKey) != null) { //already visited the screen
          entryVisitCount++;
          entryVisitCount==entryVisitCount;
        }
      else { //first visit 
        entryVisitCount = 0;

      }
      entryTimeKey = '$currentSession-$screenName-$entryVisitCount-exit';
      print("Screen Entered: $entryTimeKey");
    }
  }

  static Future<void> logScreenExit(String screenName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? currentSession = prefs.getString(_currentSessionKey);
    if (currentSession != null) {
      String exitTimeKey = '$currentSession-$screenName-$exitVisitCount-exit';
      List<String> exitTimes = prefs.getStringList(exitTimeKey) ?? [];
      exitTimes.add(DateTime.now().toIso8601String());
      if (prefs.getStringList(exitTimeKey) != null) { //already visited the screen
          exitVisitCount++;
          exitVisitCount==exitVisitCount;
        }
      else { //first visit 
        exitVisitCount = 0;

      }
      exitTimeKey = '$currentSession-$screenName-$exitVisitCount-exit';
      await prefs.setStringList(exitTimeKey, exitTimes);
      print("Screen Exited: $exitTimeKey");

      
      String entryTimeKey = '$currentSession-$screenName-entry';
      List<String> entryTimes = prefs.getStringList(entryTimeKey) ?? [];
      if (entryTimes.isNotEmpty && entryTimes.length == exitTimes.length) {
        String durationKey = '$currentSession-$screenName-duration';
        List<String> durations = prefs.getStringList(durationKey) ?? [];
        DateTime lastEntryTime = DateTime.parse(entryTimes.last);
        DateTime lastExitTime = DateTime.parse(exitTimes.last);
        int duration = lastExitTime.difference(lastEntryTime).inSeconds;
        durations.add(duration.toString());
        await prefs.setStringList(durationKey, durations);
      }
    }
  }

  // static Future<void> logQuizChoice(String screenName, String questionKey, String optionKey, String language) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? currentSession = prefs.getString(_currentSessionKey);
  //   if (currentSession != null) {
  //     String choiceKey = '$currentSession-$screenName-quiz-$questionKey';
  //     await prefs.setString(choiceKey, '$optionKey ($language)');
  //   }
  // }

  static Future<void> logQuizChoice(String screenName, String questionKey, String optionKey, String language) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? currentSession = prefs.getString(_currentSessionKey);
  if (currentSession != null) {
    String choiceKey = '$currentSession-$screenName-$questionKey';
    // Including language in the logged data
    String choiceValue = '$optionKey ($language)';
    await prefs.setString(choiceKey, choiceValue);
  }
}


  static Future<void> logVideoStart(String videoName, DateTime startTime) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? currentSession = prefs.getString('current_session');
    if (currentSession != null) {
      String startTimeKey = '$currentSession-video-$videoName-start';
      await prefs.setString(startTimeKey, startTime.toIso8601String());
    }
  }

  static Future<void> logVideoStop(String videoName, DateTime endTime, int duration) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? currentSession = prefs.getString('current_session');
    if (currentSession != null) {
      String endTimeKey = '$currentSession-video-$videoName-end';
      String durationKey = '$currentSession-video-$videoName-duration';
      await prefs.setString(endTimeKey, endTime.toIso8601String());
      await prefs.setInt(durationKey, duration);
    }
  }


static Future<void> exportData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> sessions = prefs.getStringList(_sessionKey) ?? [];
  String csvData = "Session ID, Key, Value\n";
  for (String session in sessions) {
    Map<String, dynamic> sessionData = await getSessionData(session);
    sessionData.forEach((key, value) {
      csvData += "$session, $key, $value\n";
    });
  }

  // final directory = await getApplicationDocumentsDirectory();
  // String? participantID = prefs.getString('participantID');
  // final file = File('${directory!.path}/Documents/$participantID.csv');
  // // final file = File('${directory.path}/session_data.csv');
  // await file.writeAsString(csvData);

  // CHANGES: Copy and pasting External Storage code from a previous commit Khushi made
  final directory = await getExternalStorageDirectory();
    if (directory == null) {
      // throw Exception("Could not access the external storage directory.");
      print("No access to the external storage directory.");
    }
    
    //CHANGE: I refer to the participantID to name the file
    String? participantID = prefs.getString('participantID');
    final file = File('${directory!.path}/Documents/$participantID.csv');
    
    // If the Documents directory does not exist, create it
    Directory documentsDir = Directory("${directory.path}/Documents");
    if (!documentsDir.existsSync()) {
      documentsDir.createSync(recursive: true);
    }
    // File file = File(path);
    await file.writeAsString(csvData);
  print("Participant ID: $participantID");
  print("Participant File: $file");
}


  // static Future<void> endCurrentSession() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? currentSession = prefs.getString(_currentSessionKey);
  //   if (currentSession != null) {
  //     String endTimeKey = '$currentSession-end';
  //     await prefs.setString(endTimeKey, DateTime.now().toIso8601String());
  //     await exportData(); // Automatically export data when the session ends
  //     await prefs.remove(_currentSessionKey);
  //   }
  // }

//   static Future<void> endCurrentSession() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   String? currentSession = prefs.getString(_currentSessionKey);
//   if (currentSession != null) {
//     String endTimeKey = '$currentSession-end';
//     await prefs.setString(endTimeKey, DateTime.now().toIso8601String());
//     await exportData(); // No parameters passed
//     await prefs.remove(_currentSessionKey);
//   }
// }

static Future<void> endCurrentSession() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? currentSession = prefs.getString(_currentSessionKey);
  if (currentSession != null) {
    String endTimeKey = '$currentSession-end';
    await prefs.setString(endTimeKey, DateTime.now().toIso8601String());
    // print("Awaiting exportData starts");
    await exportData(); // Correctly called without parameters
    print("Finished exportData");
    await prefs.remove(_currentSessionKey);
    await prefs.clear(); //clear all shared preferences
  }
}


static Future<Map<String, dynamic>> getSessionData(String sessionId) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  Map<String, dynamic> sessionData = {};
  prefs.getKeys().where((key) => key.startsWith(sessionId)).forEach((key) {
    sessionData[key] = prefs.get(key);
  });
  return sessionData;
}


}

