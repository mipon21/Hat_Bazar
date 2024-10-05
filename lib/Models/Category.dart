import 'package:hat_bazar/Models/SubCategory.dart';

class Category {
  String? id;
  String? title;
  String? value;
  List<SubCategory>? subCategories;
  String? coverUrl;

  Category({
    this.id, 
    this.title, 
    this.value, 
    this.coverUrl,
    this.subCategories
  });

  // fromJson method
  Category.fromJson(Map<String, dynamic> json) {
    if (json['id'] is String) {
      id = json['id'];
    }

    if (json['title'] is String) {
      title = json['title'];
    }

    if (json['value'] is String) {
      value = json['value'];
    }

    if (json['subCategories'] is List) {
      subCategories = json['subCategories']
          .map<SubCategory>((x) => SubCategory.fromJson(x))
          .toList();
    }
    
    // Corrected assignment of coverUrl
    if (json['coverUrl'] is String) {
      coverUrl = json['coverUrl'];
    }
  }

  // toJson method
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['title'] = this.title;
    data['value'] = this.value;
    data['coverUrl'] = this.coverUrl;
    
    if (subCategories != null) {
      data['subCategories'] = subCategories!.map((x) => x.toJson()).toList();
    }

    return data;
  }
}
