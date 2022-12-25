// To parse this JSON data, do
//
//     final apiModels = apiModelsFromJson(jsonString);

import 'dart:convert';

List<ApiModels> apiModelsFromJson(String str) => List<ApiModels>.from(json.decode(str).map((x) => ApiModels.fromJson(x)));

String apiModelsToJson(List<ApiModels> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ApiModels {
    ApiModels({
        required this.id,
        required this.productsPhoto,
        required this.brand,
        required this.nmBarang,
        required this.harga,
    });

    String id;
    String productsPhoto;
    String brand;
    String nmBarang;
    String harga;

    factory ApiModels.fromJson(Map<String, dynamic> json) => ApiModels(
        id: json["id"],
        productsPhoto: json["products_photo"],
        brand: json["brand"],
        nmBarang: json["nm_barang"],
        harga: json["harga"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "products_photo": productsPhoto,
        "brand": brand,
        "nm_barang": nmBarang,
        "harga": harga,
    };
}
