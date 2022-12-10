import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MarkedCoursesGridView extends StatelessWidget {
  const MarkedCoursesGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 21,
      gridDelegate:
      const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(3),
        child: ColoredBox(
          color: const Color(0xFF7CB342),
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
