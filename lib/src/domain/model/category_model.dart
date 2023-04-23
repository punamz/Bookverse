/// id : 1
/// name : "Tiên Hiệp"
/// slug : "tien-hiep"
/// description : "Truyện tiên hiệp thường kể về quá trình tu luyện và khám phá thế giới tu sĩ thần tiên đầy bí ẩn của nhân vật chính."

class CategoryModel {
  CategoryModel({
    this.id,
    this.name,
    this.slug,
    this.description,
  });

  CategoryModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    description = json['description'];
  }
  int? id;
  String? name;
  String? slug;
  String? description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['description'] = description;
    return map;
  }
}
