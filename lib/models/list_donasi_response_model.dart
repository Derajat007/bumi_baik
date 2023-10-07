// To parse this JSON data, do
//
//     final listDonasiResponseModel = listDonasiResponseModelFromJson(jsonString);

import 'dart:convert';

ListDonasiResponseModel listDonasiResponseModelFromJson(String str) => ListDonasiResponseModel.fromJson(json.decode(str));

String listDonasiResponseModelToJson(ListDonasiResponseModel data) => json.encode(data.toJson());

class ListDonasiResponseModel {
    String? message;
    List<Datum>? data;

    ListDonasiResponseModel({
        this.message,
        this.data,
    });

    factory ListDonasiResponseModel.fromJson(Map<String, dynamic> json) => ListDonasiResponseModel(
        message: json["message"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    int? id;
    String? title;
    String? image;
    String? namaUkm;
    String? namaLokasi;
    String? namaMitra;
    String? newImage;

    Datum({
        this.id,
        this.title,
        this.image,
        this.namaUkm,
        this.namaLokasi,
        this.namaMitra,
        this.newImage,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
