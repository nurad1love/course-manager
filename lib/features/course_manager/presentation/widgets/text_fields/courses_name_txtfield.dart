import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project1/features/course_manager/presentation/widgets/text_files/course_hint_txt.dart';

class TextFieldCoursesName extends StatelessWidget {
  TextFieldCoursesName({Key? key, required this.titleController})
      : super(key: key);

  TextEditingController titleController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: titleController,
      cursorColor: Colors.black54,
      decoration: InputDecoration(
        hintText: courseNameTxt,
        hintStyle: GoogleFonts.raleway(),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.withOpacity(0.3),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black87),
          borderRadius: BorderRadius.circular(13),
        ),
      ),
      style: GoogleFonts.dosis(
        fontSize: 17,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
