import 'package:flutter/material.dart';

class AppBarItem {
  final String title;
  final Icon icon;
  final int index;
  final String riverpodKey;
  AppBarItem(
      {required this.title,
      required this.icon,
      required this.index,
      required this.riverpodKey});
}

List<AppBarItem> appBarItems = [
  AppBarItem(
    title: "About",
    icon: const Icon(Icons.account_circle_rounded, size: 18),
    index: 1,
    riverpodKey: "aboutTitle",
  ),
  AppBarItem(
      title: "Experience",
      icon: const Icon(Icons.travel_explore_rounded, size: 18),
      index: 2,
      riverpodKey: "experienceTitle"),
  AppBarItem(
      title: "Work",
      icon: const Icon(Icons.computer_rounded, size: 18),
      index: 3,
      riverpodKey: "workTitle"),
  AppBarItem(
      title: "Contact",
      icon: const Icon(Icons.phone_rounded, size: 18),
      index: 4,
      riverpodKey: "contactTitle"),
];
