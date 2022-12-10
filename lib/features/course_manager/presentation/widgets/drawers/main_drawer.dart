import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project1/features/course_manager/presentation/models/drop_down_button_items/items.dart';
import 'package:project1/features/course_manager/presentation/pages/courses_page.dart';
import 'package:project1/features/course_manager/presentation/pages/home_page.dart';
import 'package:project1/features/course_manager/presentation/pages/languages_data_page.dart';
import 'package:project1/features/course_manager/presentation/pages/personalize_page.dart';
import 'package:project1/features/course_manager/settings/box_radiuses/container_radiuses.dart';
import 'package:project1/features/course_manager/settings/text_styles/all_text_styles.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 280,
      backgroundColor: Colors.blue[900],
      elevation: 0.0,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 10.0, bottom: 5),
            child: CircleAvatar(
              radius: 45,
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 5),
            child: Text(
              '$name $surname',
              style: GoogleFonts.comfortaa(fontSize: 24, color: Colors.white),
            ),
          ),
          Container(
            width: 180,
            height: 25,
            decoration: kRadius5WithColorWhite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  height: 17,
                  width: 17,
                  // child: Image(
                  //   image: AssetImage('assets/flutter_icon.png'),
                  // ),
                  child: const CircularProgressIndicator(
                    strokeWidth: 2.0,
                  ),
                ),
                Text(
                  speciality,
                  style: GoogleFonts.raleway(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Divider(
              height: 5,
              color: Colors.white,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home, color: Colors.white),
            title: Text(
              'HOME',
              style: kMontserratSize13WithColorWhite,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const HomeScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.book, color: Colors.white),
            title: Text(
              'YOUR COURSES',
              style: kMontserratSize13WithColorWhite,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const CoursesPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.code, color: Colors.white),
            title: Text(
              'LANGUAGES',
              style: kMontserratSize13WithColorWhite,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const LanguagesData()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings_rounded, color: Colors.white),
            title: Text(
              'USER SETTINGS',
              style: kMontserratSize13WithColorWhite,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const PersonalizePage()));
            },
          ),
        ],
      ),
    );
  }
}
