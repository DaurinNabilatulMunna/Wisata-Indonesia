import 'dart:convert';

klinik klinikFromJson(String str) => klinik.fromJson(json.decode(str));

String klinikToJson(klinik data) => json.encode(data.toJson());

class klinik {
  String name;
  String address;
  String openingHours;
  String phoneNumber;
  String imageUrl;

  klinik({
    required this.name,
    required this.address,
    required this.openingHours,
    required this.phoneNumber,
    required this.imageUrl,
  });

  factory klinik.fromJson(Map<String, dynamic> json) => klinik(
        name: json["name"],
        address: json["address"],
        openingHours: json["opening_hours"],
        phoneNumber: json["phone_number"],
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "address": address,
        "opening_hours": openingHours,
        "phone_number": phoneNumber,
        "image_url": imageUrl,
      };
}
