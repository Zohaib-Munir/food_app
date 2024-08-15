import 'package:food_app/model/meal.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class FoodApiService {
  final String baseUrl =
      'https://www.themealdb.com/api/json/v1/1/categories.php';

  Future<Meal> fetchAllCategories() async {
    Uri baseUri = Uri.parse(baseUrl);
    Meal data = Meal(categories: []);
    try {
      final respose = await http.get(baseUri);
      if (respose.statusCode == 200) {
        final parsedData =
            convert.jsonDecode(respose.body) as Map<String, dynamic>;
        data = Meal.fromJson(parsedData);
      }
    } catch (e) {
      throw Exception("Please Try Again");
    }
    return data;
  }
}
