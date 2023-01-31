class Category {
  final String imagUrl;
  final String name;

  Category({required this.imagUrl, required this.name});

  static List<Category> catego = [
    Category(
      imagUrl: "assets/images/emily.png",
      name: "Yoga exercises",
    ),
    Category(
      imagUrl: "assets/images/sule.png",
      name: "Example exercises",
    ),
    Category(
      imagUrl: "assets/images/alexsandra.png",
      name: "Example exercises",
    ),
  ];


}
