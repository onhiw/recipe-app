class CategoryResponse {
  final String? idCategory;
  final String? strCategory;
  final String? strCategoryThumb;
  final String? strCategoryDescription;

  const CategoryResponse({
    this.idCategory,
    this.strCategory,
    this.strCategoryThumb,
    this.strCategoryDescription,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      CategoryResponse(
        idCategory: json["idCategory"] ?? "",
        strCategory: json["strCategory"] ?? "",
        strCategoryThumb: json["strCategoryThumb"] ?? "",
        strCategoryDescription: json["strCategoryDescription"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "idCategory": idCategory ?? "",
        "strCategory": strCategory ?? "",
        "strCategoryThumb": strCategoryThumb ?? "",
        "strCategoryDescription": strCategoryDescription ?? "",
      };
}
