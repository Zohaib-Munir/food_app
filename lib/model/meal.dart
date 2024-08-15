import 'package:food_app/model/category.dart';

class Meal {
  final List<CategoryFood> categories;

  Meal({required this.categories});

  factory Meal.fromJson(Map<String, dynamic> json) => Meal(
        categories: List<CategoryFood>.from(
          json['categories'].map(
            (x) => CategoryFood.fromJson(x),
          ),
        ),
      );

  Map<String, dynamic> toJson() => {
        "categories": List<dynamic>.from(
          categories.map(
            (x) => x.toJson(),
          ),
        ),
      };

  Meal copyWith({List<CategoryFood>? categories}) =>
      Meal(categories: categories ?? this.categories);
}
