import 'dart:math';

import 'package:MobilProject/classes/api_category.dart';
import 'package:MobilProject/classes/api_customer.dart';
import 'package:MobilProject/classes/api_product.dart';
import 'package:MobilProject/classes/api_person.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ServiceReqs {
  Future<List<ApiCategory>> getCategories() async {
    try {
      final response = await Dio()
          .get("https://www.thecocktaildb.com/api/json/v1/1/list.php?c=list");
      if (response.statusCode == 200) {
        return compute(parseCategories, response.data);
      }
    } catch (e) {}
  }

  Future<List<ApiProduct>> getProductsOfCategory(String catName) async {
    try {
      final response = await Dio().get(
          "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=" +
              catName);
      if (response.statusCode == 200) {
        return compute(parseProducts, response.data);
      }
    } catch (e) {}
  }

  Future<List<ApiProduct>> getOneProduct(String prodId) async {
    try {
      print("prod id: " + prodId);
      final response = await Dio().get(
          "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=" + prodId);
      if (response.statusCode == 200) {
        return compute(parseOneProduct, response.data);
      }
    } catch (e) {}
  }

  Future<List<ApiProduct>> getRecommendedProducts(String catName) async {
    try {
      final response = await Dio().get(
          "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=" +
              catName);
      if (response.statusCode == 200) {
        return compute(parseProducts, response.data);
      }
    } catch (e) {}
  }

  Future<List<ApiPerson>> getCrew() async {
     {
      final response = await Dio().get("https://swapi.dev/api/people");
      if (response.statusCode == 200) {
        return compute(parseCrews, response.data);
      }
    } 
  }

  Future<List<ApiPerson>> getCustomers() async {
     try{
      final response = await Dio().get("https://swapi.dev/api/people/?page=2");
      if (response.statusCode == 200) {
        return compute(parseCrews, response.data);
      }
    } catch(e){}
  }


}

Future<List<ApiCategory>> parseCategories(responseData) async {
  List<ApiCategory> categories = (responseData["drinks"] as List)
      .map((cat) => ApiCategory.fromJson(cat))
      .toList();

  //https://www.thecocktaildb.com/api/json/v1/1/random.php
  for (int i = 0; i < categories.length; i++) {
    var response = await Dio().get(
        "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=" +
            categories[i].name);

    List<ApiProduct> prods = (response.data["drinks"] as List)
        .map((prod) => ApiProduct.fromJson(prod))
        .toList();

    int length = prods.length;
    var ran = new Random();
    ApiProduct prod = prods[ran.nextInt((length / 2).round())];

    categories[i].image_url = prod.image_url;
  }
  return categories;
}

List<ApiProduct> parseProducts(responseData) {
  return (responseData["drinks"] as List)
      .map((prod) => ApiProduct.fromJson(prod))
      .toList();
}

List<ApiProduct> parseOneProduct(responseData) {
  return (responseData["drinks"] as List)
      .map((prod) => ApiProduct.fromJsonLong(prod))
      .toList();
}

List<ApiPerson> parseCrews(responseData) {
  return (responseData["results"] as List)
      .map((e) => ApiPerson.fromJson(e))
      .toList();
}


List<ApiCustomer> parseCustomers(responseData) {
  return (responseData as List)
      .map((e) => ApiCustomer.fromJson(e))
      .toList();
}
