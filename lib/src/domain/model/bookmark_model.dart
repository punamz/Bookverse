/// id : 1
/// updatedDate : "2023-04-06T08:08:37.530Z"

class BookmarkModel {
  BookmarkModel({
    this.id,
    this.updatedDate,
  });

  BookmarkModel.fromJson(dynamic json) {
    id = json['id'];
    updatedDate =
        json['updatedDate'] != null ? DateTime.parse(json['updatedDate']).toLocal() : null;
  }
  int? id;
  DateTime? updatedDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['updatedDate'] = updatedDate?.toUtc().toIso8601String();
    return map;
  }
}
