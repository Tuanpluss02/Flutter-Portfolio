import 'package:flutter/material.dart';

class AppBarItem {
  final String title;
  final Icon icon;
  final int index;
  AppBarItem({required this.title, required this.icon, required this.index});
}

List<AppBarItem> appBarItems = [
  AppBarItem(
    title: "About",
    icon: const Icon(Icons.account_circle_rounded, size: 18),
    index: 1,
  ),
  AppBarItem(
    title: "Experience",
    icon: const Icon(Icons.travel_explore_rounded, size: 18),
    index: 2,
  ),
  AppBarItem(
    title: "Work",
    icon: const Icon(Icons.computer_rounded, size: 18),
    index: 3,
  ),
  AppBarItem(
    title: "Contact",
    icon: const Icon(Icons.phone_rounded, size: 18),
    index: 4,
  ),
];
