import 'dart:collection';

import 'package:flutter/material.dart';
import '../session_manager.dart';

class Likes extends ChangeNotifier {
  final Set<String> _likedMethods = {};

  /// An unmodifiable view of the items in the cart.
  UnmodifiableSetView<String> get likedMethods =>
      UnmodifiableSetView(_likedMethods);

  void toggleLikedMethod(String method) {
    String action = _likedMethods.contains(method) ? "Disliked" : "Liked";
    if (_likedMethods.contains(method)) {
      _likedMethods.remove(method);
    } else {
      _likedMethods.add(method);
    }
    notifyListeners();
    SessionManager.logEvent(action + ' Method', method);
  }

  void updateMethods(Set<String> newMethods) {
    _likedMethods.clear();
    _likedMethods.addAll(newMethods);
    notifyListeners();
    SessionManager.logEvent('Updated Liked Methods', newMethods.join(', '));
  }

  bool removeMethod(String method) {
    if (_likedMethods.contains(method)) {
      _likedMethods.remove(method);
      notifyListeners();
      SessionManager.logEvent('Removed Liked Method', method);
      return true;
    }
    return false;
  }

  void clearMethods() {
    _likedMethods.clear();
  }
}
