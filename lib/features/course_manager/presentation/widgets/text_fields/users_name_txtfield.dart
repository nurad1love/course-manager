import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../text_files/users_name_hint_txt.dart';


class TextFieldUserName extends StatelessWidget {
   TextFieldUserName({Key? key,required this.userNameController}) : super(key: key);
   TextEditingController userNameController;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: userNameController,
      cursorColor: Colors.black54,
      decoration: InputDecoration(
        hintText: usersNameTxt,
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

