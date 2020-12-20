class ApiCategory {
  String name;
  String image_url;

  ApiCategory(
    this.name,
    this.image_url,
  );

  factory ApiCategory.fromJson(Map<String, dynamic> json) {
    return ApiCategory(
      json["strCategory"] as String,
      "https://images.unsplash.com/photo-1598128558393-70ff21433be0?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=422&q=80",
    );
  }
}
