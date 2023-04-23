/// id : 142
/// header : "Chương 139: 139: Thương Lượng"
/// slug : "tam-than-ky/chuong-139"
/// viewCount : 0
/// updatedDate : "2023-04-05T08:12:24.277Z"
/// story : {"id":1,"slug":"tam-than-ky"}

class ChapterModel {
  ChapterModel({
    this.id,
    this.header,
    this.slug,
    this.viewCount,
    this.updatedDate,
    this.story,
  });

  ChapterModel.fromJson(dynamic json) {
    id = json['id'];
    header = json['header'];
    slug = json['slug'];
    viewCount = json['viewCount'];
    updatedDate =
        json['updatedDate'] != null ? DateTime.parse(json['updatedDate']).toLocal() : null;
    story = json['story'] != null ? Story.fromJson(json['story']) : null;
  }
  int? id;
  String? header;
  String? slug;
  int? viewCount;
  DateTime? updatedDate;
  Story? story;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['header'] = header;
    map['slug'] = slug;
    map['viewCount'] = viewCount;
    map['updatedDate'] = updatedDate?.toUtc().toIso8601String();
    if (story != null) {
      map['story'] = story?.toJson();
    }
    return map;
  }
}

class Story {
  Story({
    this.id,
    this.slug,
  });

  Story.fromJson(dynamic json) {
    id = json['id'];
    slug = json['slug'];
  }
  int? id;
  String? slug;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['slug'] = slug;
    return map;
  }
}
