// To parse this JSON data, do
//
//     final wisata = wisataFromJson(jsonString);

import 'dart:convert';

Wisata wisataFromJson(String str) => Wisata.fromJson(json.decode(str));

String wisataToJson(Wisata data) => json.encode(data.toJson());

class Wisata {
  String nama;
  String lokasi;
  String rating;
  String like;
  String gambar;
  String deskripsi;

  Wisata({
    required this.nama,
    required this.lokasi,
    required this.rating,
    required this.like,
    required this.gambar,
    required this.deskripsi,
  });

  factory Wisata.fromJson(Map<String, dynamic> json) => Wisata(
        nama: json["nama"],
        lokasi: json["lokasi"],
        rating: json["rating"],
        like: json["like"],
        gambar: json["gambar"],
        deskripsi: json["deskripsi"],
      );

  Map<String, dynamic> toJson() => {
        "nama": nama,
        "lokasi": lokasi,
        "rating": rating,
        "like": like,
        "gambar": gambar,
        "deskripsi": deskripsi,
      };
}
