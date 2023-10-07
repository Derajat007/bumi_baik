// To parse this JSON data, do
//
//     final detailDonasiResponseModel = detailDonasiResponseModelFromJson(jsonString);

import 'dart:convert';

DetailDonasiResponseModel detailDonasiResponseModelFromJson(String str) => DetailDonasiResponseModel.fromJson(json.decode(str));

String detailDonasiResponseModelToJson(DetailDonasiResponseModel data) => json.encode(data.toJson());

class DetailDonasiResponseModel {
    String? message;
    Data? data;

    DetailDonasiResponseModel({
        this.message,
        this.data,
    });

    factory DetailDonasiResponseModel.fromJson(Map<String, dynamic> json) => DetailDonasiResponseModel(
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

  get id => null;

  get image => null;

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data?.toJson(),
    };
}

class Data {
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

    Data({
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

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        description: json["description"],
        target: json["target"],
        collected: json["collected"],
        dueDate: json["due_date"] == null ? null : DateTime.parse(json["due_date"]),
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
