import 'package:flutter/widgets.dart';

class Task {
  String? taskDesc;
  String? startDate;
  String? endDate;
  String? category;
  bool favorite;
  TextDecoration taskDescDecoration;
  Color taskColor;

  Task({
    this.taskDesc,
    this.startDate,
    this.endDate,
    this.category,
    this.favorite = false,
    this.taskDescDecoration = TextDecoration.none,
    this.taskColor = const Color(0xff5F33E1),
  });
}
