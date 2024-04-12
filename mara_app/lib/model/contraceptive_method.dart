import 'package:flutter/material.dart';
enum Category {
  all
}
class ContraceptiveMethod {
  const ContraceptiveMethod({
    required this.ref,
    required this.jsonRef,
    required this.icon,
    required this.name,
    required this.description,
    this.brands = '',
    required this.top,
    required this.left,
    required this.size,
    required this.arrowTop,
    required this.arrowLeft,
    required this.arrowSize,
  });

    // final bool isFavorited;
    final String ref;  // string reference for icons
    final String jsonRef;
    final IconData icon;
    final String name;
    final String description;
    final String brands;
    final double top, left, size, arrowTop, arrowLeft, arrowSize;

    String get arrowName => 'assets/options-icons/arrow_$ref.svg';

    @override
    String toString() => "$name (id=$ref)";

}