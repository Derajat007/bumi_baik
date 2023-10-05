// To parse this JSON data, do
//
//     final donasiListRespone = donasiListResponeFromJson(jsonString);

import 'dart:convert';

// DonasiListRespone donasiListResponeFromJson(String str) =>
//     DonasiListRespone.fromJson(json.decode(str));

// String donasiListResponeToJson(DonasiListRespone data) =>
//     json.encode(data.toJson());

// class DonasiListRespone {
//   String? message;
//   List<Datum>? data;

//   DonasiListRespone({
//     this.message,
//     this.data,
//   });

//   factory DonasiListRespone.fromJson(Map<String, dynamic> json) =>
//       DonasiListRespone(
//         message: json["message"],
//         data: json["data"] == null
//             ? []
//             : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "message": message,
//         "data": data == null
//             ? []
//             : List<dynamic>.from(data!.map((x) => x.toJson())),
//       };
// }

class Donasi {
  int? id;
  String? title;
  String? image;
  String? namaUkm;
  String? namaLokasi;
  String? namaMitra;
  String? newImage;

  Donasi({
    this.id,
    this.title,
    this.image,
    this.namaUkm,
    this.namaLokasi,
    this.namaMitra,
    this.newImage,
  });

  factory Donasi.fromJson(Map<String, dynamic> json) => Donasi(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        namaUkm: json["nama_ukm"],
        namaLokasi: json["nama_lokasi"],
        namaMitra: json["nama_mitra"],
        newImage: json["new_image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "nama_ukm": namaUkm,
        "nama_lokasi": namaLokasi,
        "nama_mitra": namaMitra,
        "new_image": newImage,
      };
}
