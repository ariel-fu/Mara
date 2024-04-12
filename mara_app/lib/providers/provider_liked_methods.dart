import 'dart:collection';

import 'package:flutter/material.dart';

class Likes extends ChangeNotifier {
  final Set<String> _likedMethods = {};

  /// An unmodifiable view of the items in the cart.
  UnmodifiableSetView<String> get likedMethods => UnmodifiableSetView(_likedMethods);

  void toggleLikedMethod(String method) {
    if (_likedMethods.contains(method)) {
      _likedMethods.remove(method);
    } else {
      _likedMethods.add(method);
    }
    notifyListeners();
  }

  void updateMethods(Set<String> newMethods) {
    _likedMethods.clear();
    _likedMethods.addAll(newMethods);
    notifyListeners();
  }
}