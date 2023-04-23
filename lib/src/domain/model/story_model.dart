/// id : 1
/// title : "Tầm Thần Ký 1312123123123"
/// author : "Trường Lộ Cô Hành"
/// slug : "tam-than-ky"
/// description : ["Tác giả: Trường Lộ Cô Hành","","Thể loại: Tiên Hiệp","","Giới thiệu:","","Trong Tầm Thần Ký của tác giả Trường Lộ Cô Hành, Tịch Thần đột ngột qua đời với nhiều bí ẩn còn chưa được làm rõ. Nhưng rồi nàng được tái sinh vào một thế giới mới với cơ thể và trí nhớ hoàn toàn mới. Cuộc hành trình của nàng đầu từ việc tìm kiếm sự thật về cái chết của mình, tránh qua được những âm mưu nguy hiểm và giải quyết những bí mật bị chôn vùi. Khi gặp được những người bạn đồng hành thực sự, nàng mới có thể chứng minh được đại đạo của mình và hoàn thành mục tiêu cuối cùng."]
/// poster : "https://truyen.ewr1.vultrobjects.com/cover/tam-than-ky.jpg"
/// categoryList : ["Tiên Hiệp","Dị Giới","Huyền Huyễn","Xuyên Không","Trọng Sinh","Nữ Cường","Khác"]
/// status : "Đang ra"
/// uploadDate : "2023-04-05T04:13:09.452Z"
/// updatedDate : "2023-04-07T06:19:40.204Z"
/// deletedAt : null

class StoryModel {
  StoryModel({
    this.id,
    this.title,
    this.author,
    this.slug,
    this.description,
    this.poster,
    this.categoryList,
    this.status,
    this.uploadDate,
    this.updatedDate,
    this.deletedAt,
  });

  StoryModel.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    author = json['author'];
    slug = json['slug'];
    description = json['description'] != null ? json['description'].cast<String>() : [];
    poster = json['poster'];
    categoryList = json['categoryList'] != null ? json['categoryList'].cast<String>() : [];
    status = json['status'];
    uploadDate = json['uploadDate'] != null ? DateTime.parse(json['uploadDate']) : null;
    updatedDate = json['updatedDate'] != null ? DateTime.parse(json['updatedDate']) : null;
    deletedAt = json['deletedAt'] != null ? DateTime.parse(json['deletedAt']) : null;
  }
  int? id;
  String? title;
  String? author;
  String? slug;
  List<String>? description;
  String? poster;
  List<String>? categoryList;
  String? status;
  DateTime? uploadDate;
  DateTime? updatedDate;
  DateTime? deletedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['author'] = author;
    map['slug'] = slug;
    map['description'] = description;
    map['poster'] = poster;
    map['categoryList'] = categoryList;
    map['status'] = status;
    map['uploadDate'] = uploadDate?.toUtc().toIso8601String();
    map['updatedDate'] = updatedDate?.toUtc().toIso8601String();
    map['deletedAt'] = deletedAt?.toUtc().toIso8601String();
    return map;
  }
}
