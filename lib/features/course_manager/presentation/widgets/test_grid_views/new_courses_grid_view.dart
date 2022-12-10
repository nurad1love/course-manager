import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class NewCoursesGridViewBuilder extends StatelessWidget {
  const NewCoursesGridViewBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 40,
      gridDelegate:
      const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(3),
        child: ColoredBox(
          color: const Color(0xFF757575),
          child: Center(
            child: Text(
              'Example course',
              style: GoogleFonts.montserrat(
                  fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
