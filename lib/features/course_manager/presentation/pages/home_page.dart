import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project1/features/course_manager/presentation/pages/personalize_page.dart';
import 'package:project1/features/course_manager/presentation/widgets/drawers/main_drawer.dart';

import '../widgets/delegates/search_delegate.dart';
import '../widgets/test_grid_views/marked_courses_grid_view.dart';
import '../widgets/test_grid_views/new_courses_grid_view.dart';
import '../widgets/test_grid_views/selected_courses_grid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Icon searchIcon = const Icon(Icons.search_sharp);
  final Text constTitle = Text(
    'HOME',
    style: GoogleFonts.montserrat(
        fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
  );

  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        drawer: const MainDrawer(),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0.0,
          backgroundColor: Colors.white,
          centerTitle: false,
          title: constTitle,
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    showSearch(
                        context: context,
                        // delegate to customize the search bar
                        delegate: MainSearchDelegate());
                  });
                },
                icon: searchIcon),
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PersonalizePage(),
                    ),
                  );
                },
                icon: const Icon(Icons.settings_rounded))
          ],
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Text(
                  "News",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 13),
                ),
              ),
              Tab(
                child: Text(
                  "Marked",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 13),
                ),
              ),
              Tab(
                child: Text(
                  "Your",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 13),
                ),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            NewCoursesGridViewBuilder(),
            SelectedCoursesGridView(),
            MarkedCoursesGridView(),
          ],
        ),
      ),
    );
  }
}
