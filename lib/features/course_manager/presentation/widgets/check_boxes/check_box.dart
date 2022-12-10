import 'package:flutter/material.dart';
import 'package:project1/features/course_manager/presentation/models/categories/categories.dart';
import '../../pages/courses_page.dart';



class MyCheckBox extends StatefulWidget {
  const MyCheckBox({super.key, required this.category, required this.index});

  final Category category;
  final int index;

  @override
  State<MyCheckBox> createState() => _MyCheckBoxState();
}

class _MyCheckBoxState extends State<MyCheckBox> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: checked,
      onChanged: (value) {
        checked = value!;

        if (checked) {
          selectedCategories.add(widget.category);
        } else {
          selectedCategories.removeAt(widget.index);
        }

        setState(() {});
      },
    );
  }
}
