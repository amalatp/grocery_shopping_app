import 'dart:convert';

import 'package:grocery_shopping_app/features/home/data/data_provider/home_data_provider.dart';
import 'package:grocery_shopping_app/features/home/models/pduct_model.dart';

class HomeRepository {
  final HomeDataProvider homeDataProvider;
  HomeRepository(this.homeDataProvider);

  Future<List<ProductModel>> getProductList() async {
    try {
      final response = await homeDataProvider.getProductList();
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return ProductModel.fromJsonList(data);
      } else {
        throw Exception("Failed to fetch product list: ${response.body}");
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
