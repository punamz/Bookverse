/// count : 1
/// isFavorite : false

class FavoriteModel {
  FavoriteModel({
    this.count,
    this.isFavorite,
  });

  FavoriteModel.fromJson(dynamic json) {
    count = json['count'];
    isFavorite = json['isFavorite'];
  }
  int? count;
  bool? isFavorite;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    map['isFavorite'] = isFavorite;
    return map;
  }
}
