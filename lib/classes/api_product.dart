class ApiProduct {
  String name;
  String image_url;
  String id;
  String desc;

  ApiProduct(
    this.id,
    this.name,
    this.image_url,
  );

  ApiProduct.long(
    this.id,
    this.name,
    this.image_url,
    this.desc,
  );
  factory ApiProduct.fromJson(Map<String, dynamic> json) {
    return ApiProduct(
      json["idDrink"] as String,
      json["strDrink"] as String,
      json["strDrinkThumb"] as String,
    );
  }

  factory ApiProduct.fromJsonLong(Map<String, dynamic> json) {
    return ApiProduct.long(
      json["idDrink"] as String,
      json["strDrink"] as String,
      json["strDrinkThumb"] as String,
      json["strInstructions"] as String,
    );
  }
}
