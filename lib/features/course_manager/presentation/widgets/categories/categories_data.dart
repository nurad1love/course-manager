import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project1/features/course_manager/presentation/models/categories/categories.dart';
import 'package:project1/features/course_manager/presentation/pages/courses_page.dart';
import 'package:project1/features/course_manager/presentation/widgets/check_boxes/check_box.dart';

class CategoriesData extends StatefulWidget {
  const CategoriesData({Key? key}) : super(key: key);

  @override
  State<CategoriesData> createState() => _CategoriesDataState();
}

class _CategoriesDataState extends State<CategoriesData> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: 380,
        height: 45,
        margin: const EdgeInsets.only(top: 8),
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black26)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.separated(
                shrinkWrap: true,
                itemBuilder: (_, index) {
                  final category = categories[index];
                  return Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(
                              top: 10, bottom: 10, left: 10),
                          width: 300,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.indigo[300],
                            borderRadius:
                            BorderRadius.circular(15),
                          ),
                          child: Column(
                            children: [
                              Container(
                                width: 290,
                                height: 40,
                                margin: const EdgeInsets.only(
                                    top: 8, left: 8, right: 8),
                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(15),
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: Text(
                                    category.title,
                                    style:
                                    GoogleFonts.josefinSans(
                                        fontSize: 35),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 6),
                      MyCheckBox(
                        category: category,
                        index: index,
                      ),
                    ],
                  );
                },
                separatorBuilder: (_, __) => spacer,
                itemCount: categories.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
