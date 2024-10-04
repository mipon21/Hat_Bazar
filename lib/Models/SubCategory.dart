class SubCategory {
  String? id;
  String? title;
  String? value;

  SubCategory({this.id, this.title, this.value});

  // fromJson method
  SubCategory.fromJson(Map<String, dynamic> json) {
    if (json['id'] is String) {
      id = json['id'];
    }

    if (json['title'] is String) {
      title = json['title'];
    }

    if (json['value'] is String) {
      value = json['value'];
    }
  }

  // toJson method
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['title'] = this.title;
    data['value'] = this.value;
    return data;
  }
}
