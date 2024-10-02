class Review {
  String? reviewrName;
  double? rating;
  String? comment;
  String? reviewDate;

  Review({this.reviewrName, this.rating, this.comment, this.reviewDate});

  Review.fromJson(Map<String, dynamic> json) {
    if (json['reviewrName'] is String) {
      reviewrName = json['reviewrName'];
    }

    if (json['rating'] is num) {
      rating = (json['rating'] as num).toDouble(); // Convert to double if it's a number
    }

    if (json['comment'] is String) {
      comment = json['comment'];
    }

    if (json['reviewDate'] is String) {
      reviewDate = json['reviewDate'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['reviewrName'] = this.reviewrName;
    data['rating'] = this.rating;
    data['comment'] = this.comment;
    data['reviewDate'] = this.reviewDate;
    return data;
  }
}
