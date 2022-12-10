import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project1/features/course_manager/presentation/models/categories/categories.dart';
import 'package:project1/features/course_manager/presentation/widgets/appbars/language_data_appbar.dart';
import 'package:project1/features/course_manager/presentation/widgets/images/images.dart';
import '../models/informations_of_categories/language_data.dart';


class LanguagesData extends StatefulWidget {
  const LanguagesData({Key? key}) : super(key: key);

  @override
  State<LanguagesData> createState() => _LanguagesDataState();
}

class _LanguagesDataState extends State<LanguagesData> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[300],
      appBar: langDataAppBar,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.separated(
                shrinkWrap: true,
                itemBuilder: (_, index){
                  final category = categories[index];
                  final image = images[index];
                  final langData = languageData[index];
                  return Container(
                      margin: const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 5),
                      width: 400,
                      height: 250,
                      decoration: BoxDecoration(
                        color: Colors.white, borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                 SizedBox(
                                  width: 25,
                                  height: 25,
                                  child: Image(image: AssetImage(image.indexedImage),
                                  ),
                                 ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  category.title,
                                  style: GoogleFonts.montserrat(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(
                            height: 5,
                            color: Colors.black54,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              langData.langData,
                              style: GoogleFonts.nunito(
                                fontSize: 16,
                                color: Colors.black
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                },
                separatorBuilder: (_, __) => const SizedBox(
                  height: 0,
                ),
                itemCount: categories.length
            ),
          ],
        ),
      )
    );
  }
}

