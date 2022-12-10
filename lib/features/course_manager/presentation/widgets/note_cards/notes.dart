

import 'package:project1/features/course_manager/presentation/models/categories/categories.dart';

class Note {
  final String title;
  final String userNameTitle;
  final List<Category> selectedCategories;

  Note( {required this.title, required this.selectedCategories,required this.userNameTitle});

  @override
  String toString() =>
      "Note(title: $title, selectedCategories: $selectedCategories, userName: $userNameTitle)";
}

List<Note> notes = [];