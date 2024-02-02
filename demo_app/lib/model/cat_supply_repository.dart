// based on material app tutorial 102
import 'cat_supply.Dart';

class CatProductRepository {
  static List<CatProduct> loadProducts(Category category) {
    const allCatProducts = <CatProduct>[];
    if (category == Category.all) {
      return allCatProducts;
    } else {
      return allCatProducts.where((CatProduct p) {  // support for filters
        return p.category == category;
      }).toList();
    }
  }
}