class Images{
  final String indexedImage;

  Images({required this.indexedImage});

  Images toImage() => Images(indexedImage: indexedImage);
}

List<Images> images = [
  Images(indexedImage: 'assets/python_icon.png'),
  Images(indexedImage: 'assets/php.png'),
  Images(indexedImage: 'assets/kotlin_icon.png'),
  Images(indexedImage: 'assets/dart.png'),
  Images(indexedImage: 'assets/java.png'),
  Images(indexedImage: 'assets/js.png'),
  Images(indexedImage: 'assets/c.png'),
  Images(indexedImage: 'assets/c_sharp.png'),
  Images(indexedImage: 'assets/c++_icon.png'),
  Images(indexedImage: 'assets/html_icon.png'),
];