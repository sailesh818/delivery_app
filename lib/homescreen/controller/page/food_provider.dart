import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/database/page/database_page.dart';
import 'package:food_delivery_app/homescreen/model/foods_model.dart';
import 'package:http/http.dart' as http;
//import '../../database/page/database_page.dart';
//import '../model/foods_model.dart';

class FoodProvider extends ChangeNotifier {
  final DBHelper dbHelper = DBHelper();
  List<FoodsModel> _foods = [];
  bool _isLoading = false;

  List<FoodsModel> get foods => _foods;
  bool get isLoading => _isLoading;

  Future<void> fetchFoodsByCategory(String category) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await http.get(
        Uri.parse('https://your-api-url.com/foods?category=$category'),
      );

      if (response.statusCode == 200) {
        final List data = json.decode(response.body);

        _foods =
            data
                .map(
                  (item) => FoodsModel(
                    name: item['name'],
                    image: item['image'],
                    cuisines: item['cuisines'],
                    price: item['price'],
                  ),
                )
                .toList();
      } else {
        throw Exception('Failed to load foods');
      }
    } catch (e) {
      print('Error fetching foods: $e');
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> loadOfflineData() async {
    final savedFoods = await dbHelper.getFoods();
    _foods = savedFoods;
    notifyListeners();
  }

  Future<void> saveFoodOffline(FoodsModel food) async {
    await dbHelper.insertFood(food);
    await loadOfflineData();
  }
}
