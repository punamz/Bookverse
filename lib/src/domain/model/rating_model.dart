/// id : 1
/// value : 3

class RatingModel {
  RatingModel({
    this.id,
    this.value,
  });

  RatingModel.fromJson(dynamic json) {
    id = json['id'];
    value = json['value'];
  }
  int? id;
  int? value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['value'] = value;
    return map;
  }
}
