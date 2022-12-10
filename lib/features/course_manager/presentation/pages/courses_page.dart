import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project1/features/course_manager/presentation/widgets/appbars/courses_page_appbar.dart';
import 'package:project1/features/course_manager/presentation/widgets/categories/categories_data.dart';
import 'package:project1/features/course_manager/presentation/widgets/drawers/main_drawer.dart';
import 'package:project1/features/course_manager/presentation/widgets/note_cards/notes.dart';
import 'package:project1/features/course_manager/presentation/widgets/text_fields/courses_name_txtfield.dart';
import 'package:project1/features/course_manager/presentation/widgets/text_fields/users_name_txtfield.dart';
import '../../settings/box_radiuses/container_radiuses.dart';
import '../models/categories/categories.dart';
import 'information_of_course_page.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage ({super.key});

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

List<Category> selectedCategories = [];

 const spacer = SizedBox(height: 5);

class _CoursesPageState extends State<CoursesPage>  {
  final userNameController = TextEditingController();
  final courseController = TextEditingController();

  void initFireBase() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }

  void initeState() {
    super.initState();
    initFireBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: kCoursesPageAppBar,
      backgroundColor: Colors.indigo[400],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: Container(
                width: 400,
                height: 450,
                color: Colors.white,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: SizedBox(
                        width: 380,
                        child: TextFieldCoursesName(
                            titleController: courseController),
                      ),
                    ),
                    SizedBox(
                      width: 380,
                      child: TextFieldUserName(
                        userNameController: userNameController,
                      ),
                    ),
                    const CategoriesData(),
                  ],
                ),
              ),
              actions: [
                Container(
                  width: 100,
                  height: 50,
                  decoration: kRadius10,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(Colors.indigo[300]),
                    ),
                    onPressed: () {
                      // Creating a Note
                      final note = Note(
                        title: courseController.text,
                        userNameTitle: userNameController.text,
                        selectedCategories:
                        List<Category>.from(selectedCategories),
                      );
                      // Adding a Note to notes list
                      notes.add(note);

                      // Clearing fields
                      courseController.clear();
                      userNameController.clear();

                      // Clearing selected categories
                      selectedCategories.clear();

                      // Updating state to redraw NoteCard`s
                      setState(() {});

                      // Closing dialog
                      Navigator.pop(context);
                    },
                    child: Text(
                      'ADD WIDGET',
                      style: GoogleFonts.raleway(
                        fontSize: 13,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.red,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 5, right: 5, left: 5),
        child: ListView.builder(
          itemCount: notes.length,
          itemBuilder: (_, index) {
            final note = notes[index];
            return Dismissible(
              key: UniqueKey(),
              onDismissed: (direction) {
                // Remove note after dismiss from notes
                notes.removeAt(index);
              },
              confirmDismiss: (DismissDirection direction) async {
                return await showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: Column(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 5.0, bottom: 10.0),
                          child: Text(
                            'Confirm',
                            style: GoogleFonts.montserrat(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          'Do you really want to delete the course?',
                          style: GoogleFonts.dosis(fontSize: 17),
                        ),
                      ],
                    ),
                    actions: [
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith((states) => Colors.redAccent)
                        ),
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                        child: Text('Delete'.toUpperCase()),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith((states) => Colors.indigo)
                        ),
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        child: Text('cancel'.toUpperCase()),
                      ),
                    ],
                  ),
                );
              },
              child: Card(
                color: Colors.black12,
                //  margin: EdgeInsets.symmetric(horizontal: 50),
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: Container(
                  height: 190,
                  decoration: kRadius10,
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                margin:
                                    const EdgeInsets.only(top: 10, left: 10),
                                decoration: kRadius5WithColorWhite,
                                child: Center(
                                  child: Text(
                                    note.title,
                                    style: GoogleFonts.raleway(fontSize: 25),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                margin: const EdgeInsets.only(
                                    top: 10, left: 10, bottom: 10),
                                decoration: kRadius5WithColorWhite,
                                child: Center(
                                  child: Text(
                                    note.userNameTitle,
                                    style: GoogleFonts.raleway(fontSize: 25),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 5, bottom: 10.0),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              const InformationScreen()));
                                },
                                child: Text(
                                  'MORE INFORMATION',
                                  style:
                                      GoogleFonts.raleway(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 170,
                                margin: const EdgeInsets.only(top: 10),
                                decoration: kRadius5WithColorWhite,
                                child: Center(
                                  child: Column(
                                    children: [
                                      Text(note.selectedCategories
                                          .map((e) => e.title)
                                          .join("\n")),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
