class ApiCustomer {
  String name;
  int order_num;

  ApiCustomer(
    this.name,
    this.order_num,
  );

  factory ApiCustomer.fromJson(Map<String, dynamic> json){
    return ApiCustomer(
      json["name"] as String,
      (int.tryParse(json["codigo"]) ?? 2) % 5 as int
    );
  }
}
