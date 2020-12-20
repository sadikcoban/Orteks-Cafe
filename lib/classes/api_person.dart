class ApiPerson {
  String name;
  String productNum;
  String customerNum;
  String gender;

  ApiPerson(
    this.name,
    this.productNum,
    this.customerNum,
    this.gender,
  );

  factory ApiPerson.fromJson(Map<String, dynamic> json) {
    return ApiPerson(
      json["name"] as String,
      json["height"] as String,
      json["mass"] as String,
      json["gender"] as String,
    );
  }
}
