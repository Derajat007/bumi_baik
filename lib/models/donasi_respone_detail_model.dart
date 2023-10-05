// To parse this JSON data, do
//
//     final donasiDetailRespone = donasiDetailResponeFromJson(jsonString);

import 'dart:convert';

// DonasiDetailRespone donasiDetailResponeFromJson(String str) =>
//     DonasiDetailRespone.fromJson(json.decode(str));

// String donasiDetailResponeToJson(DonasiDetailRespone data) =>
//     json.encode(data.toJson());

// class DonasiDetailRespone {
//   String? message;
//   Data? data;

//   DonasiDetailRespone({
//     this.message,
//     this.data,
//   });

//   factory DonasiDetailRespone.fromJson(Map<String, dynamic> json) =>
//       DonasiDetailRespone(
//         message: json["message"],
//         data: json["data"] == null ? null : Data.fromJson(json["data"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "message": message,
//         "data": data?.toJson(),
//       };
// }

class DonasiDetail {
  int? id;
  String? title;
  String? image;
  String? description;
  int? target;
  int? collected;
  DateTime? dueDate;
  String? namaUkm;
  String? namaLokasi;
  dynamic plantingDate;
  dynamic namaMitra;

  DonasiDetail({
    this.id,
    this.title,
    this.image,
    this.description,
    this.target,
    this.collected,
    this.dueDate,
    this.namaUkm,
    this.namaLokasi,
    this.plantingDate,
    this.namaMitra,
  });

  factory DonasiDetail.fromJson(Map<String, dynamic> json) => DonasiDetail(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        description: json["description"],
        target: json["target"],
        collected: json["collected"],
        dueDate:
            json["due_date"] == null ? null : DateTime.parse(json["due_date"]),
        namaUkm: json["nama_ukm"],
        namaLokasi: json["nama_lokasi"],
        plantingDate: json["planting_date"],
        namaMitra: json["nama_mitra"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "description": description,
        "target": target,
        "collected": collected,
        "due_date": dueDate?.toIso8601String(),
        "nama_ukm": namaUkm,
        "nama_lokasi": namaLokasi,
        "planting_date": plantingDate,
        "nama_mitra": namaMitra,
      };
}
