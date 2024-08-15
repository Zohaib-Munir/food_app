class CategoryFood {
  final String idCategory;
  final String strCategory;
  final String strCategoryThumb;
  final String strCategoryDescription;

  CategoryFood({
    required this.idCategory,
    required this.strCategory,
    required this.strCategoryThumb,
    required this.strCategoryDescription,
  });

  CategoryFood coptyWith(
    String? idCategory,
    String? strCategory,
    String? strCategoryDescription,
    String? strCategoryThumb,
  ) {
    return CategoryFood(
      idCategory: idCategory ?? this.idCategory,
      strCategory: strCategory ?? this.strCategory,
      strCategoryThumb: strCategoryThumb ?? this.strCategoryThumb,
      strCategoryDescription:
          strCategoryDescription ?? this.strCategoryDescription,
    );
  }

  factory CategoryFood.fromJson(Map<String, dynamic> json) => CategoryFood(
        idCategory: json['idCategory'],
        strCategory: json['strCategory'],
        strCategoryThumb: json['strCategoryThumb'],
        strCategoryDescription: json['strCategoryDescription'],
      );
  Map<String, dynamic> toJson() => {
        "idCategory": idCategory,
        "strCategory": strCategory,
        "strCategoryDescription": strCategoryDescription,
        "strCategoryThumb": strCategoryThumb,
      };
}
