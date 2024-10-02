import 'package:hat_bazar/Models/Review.dart';

class Product {
  String? id;
  String? name;
  String? description;
  double? stock;
  double? sellPrice;
  double? purchasePrice;
  String? unit;
  double? unitPrice;
  List<String>? tags;
  String? category;
  List<String>? images;
  String? cratedAt;
  String? updatedAt;
  bool? isActive;
  List<Review>? reviews;
  double? discount;
  String? discountStartDate;
  String? discountEndDate;
  String? supplier;
  double? averageRating;

  Product(
      {this.id,
      this.name,
      this.description,
      this.stock,
      this.sellPrice,
      this.purchasePrice,
      this.unit,
      this.unitPrice,
      this.tags,
      this.category,
      this.images,
      this.cratedAt,
      this.updatedAt,
      this.isActive,
      this.reviews,
      this.discount,
      this.discountStartDate,
      this.discountEndDate,
      this.supplier,
      this.averageRating});

  // fromJson method
  Product.fromJson(Map<String, dynamic> json) {
    if (json['id'] is String) {
      id = json['id'];
    }

    if (json['name'] is String) {
      name = json['name'];
    }

    if (json['description'] is String) {
      description = json['description'];
    }

    if (json['stock'] is num) {
      stock = (json['stock'] as num).toDouble();
    }

    if (json['sellPrice'] is double) {
      sellPrice = (json['sellPrice'] as num).toDouble();
    }

    if (json['purchasePrice'] is double) {
      purchasePrice = (json['purchasePrice'] as num).toDouble();
    }

    if (json['unit'] is String) {
      unit = json['unit'];
    }

    if (json['unitPrice'] is double) {
      unitPrice = (json['unitPrice'] as num).toDouble();
    }

    if (json['tags'] is List) {
      tags = List<String>.from(json['tags']);
    }

    if (json['category'] is String) {
      category = json['category'];
    }

    if (json['images'] is List) {
      images = List<String>.from(json['images']);
    }

    if (json['cratedAt'] is String) {
      cratedAt = json['cratedAt'];
    }

    if (json['updatedAt'] is String) {
      updatedAt = json['updatedAt'];
    }

    if (json['isActive'] is bool) {
      isActive = json['isActive'];
    }

    if (json['reviews'] is List) {
      reviews = List<Review>.from(
          json['reviews'].map((reviewJson) => Review.fromJson(reviewJson)));
    }

    if (json['discount'] is num) {
      discount = (json['discount'] as num).toDouble();
    }

    if (json['discountStartDate'] is String) {
      discountStartDate = json['discountStartDate'];
    }

    if (json['discountEndDate'] is String) {
      discountEndDate = json['discountEndDate'];
    }

    if (json['supplier'] is String) {
      supplier = json['supplier'];
    }

    if (json['averageRating'] is num) {
      averageRating = (json['averageRating'] as num).toDouble();
    }
  }

  // toJson method
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['stock'] = this.stock;
    data['sellPrice'] = this.sellPrice;
    data['purchasePrice'] = this.purchasePrice;
    data['unit'] = this.unit;
    data['unitPrice'] = this.unitPrice;
    if (this.tags != null) {
      data['tags'] = this.tags;
    }
    data['category'] = this.category;
    if (this.images != null) {
      data['images'] = this.images;
    }
    data['cratedAt'] = this.cratedAt;
    data['updatedAt'] = this.updatedAt;
    data['isActive'] = this.isActive;
    if (this.reviews != null) {
      data['reviews'] = this.reviews!.map((v) => v.toJson()).toList();
    }
    data['discount'] = this.discount;
    data['discountStartDate'] = this.discountStartDate;
    data['discountEndDate'] = this.discountEndDate;
    data['supplier'] = this.supplier;
    data['averageRating'] = this.averageRating;
    return data;
  }
}
