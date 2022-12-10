class Category {
  final String title;

  Category({required this.title});

  @override
  String toString() => "Category(title: $title)";
}

List<Category> categories = [
  Category(title: "Python"),
  Category(title: "PHP"),
  Category(title: "Kotlin"),
  Category(title: "Dart"),
  Category(title: "Java"),
  Category(title: "JavaScript"),
  Category(title: "C"),
  Category(title: "C#"),
  Category(title: "C++"),
  Category(title: "HTML"),
];
