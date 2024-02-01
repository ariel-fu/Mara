// based on material app tutorial 102
enum Category {
  all,
  nutrition,
  toys,
  hygiene,
}

class CatProduct {
  const CatProduct({
    required this.category,
    required this.id,
    required this.isFeatured,
    required this.name,
  });

  final Category category;
  final int id;
  final bool isFeatured;
  final String name;

  String get assetName => 'image$id.jpg';

  @override
  String toString() => "$name (id=$id)";
}
