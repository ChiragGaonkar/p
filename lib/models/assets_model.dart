// To parse this JSON data, do
//
//     final assets = assetsFromJson(jsonString);

import 'dart:convert';

List<Assets> assetsFromJson(String str) =>
    List<Assets>.from(json.decode(str).map((x) => Assets.fromJson(x)));

String assetsToJson(List<Assets> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Assets {
  Assets({
    required this.assetId,
    required this.name,
    required this.volume1HrsUsd,
    required this.priceUsd,
  });

  String assetId;
  String name;
  double volume1HrsUsd;
  double priceUsd;

  factory Assets.fromJson(Map<String, dynamic> json) => Assets(
        assetId: json["asset_id"],
        name: json["name"],
        volume1HrsUsd: json["volume_1hrs_usd"],
        priceUsd: json["price_usd"],
      );

  Map<String, dynamic> toJson() => {
        "asset_id": assetId,
        "name": name,
        "volume_1hrs_usd": volume1HrsUsd,
        "price_usd": priceUsd,
      };
}
