enum Category {
  all
}
class ContraceptiveMethod {
  const ContraceptiveMethod({
    required this.ref,
    required this.name,
    required this.description,
    this.brands = '',
  });

    // final bool isFavorited;
    final String ref;  // string reference for icons
    final String name;
    final String description;
    final String brands;

    String get arrowName => 'arrow_$ref.svg';

    @override
    String toString() => "$name (id=$ref)";

}