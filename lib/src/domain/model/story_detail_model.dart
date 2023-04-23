import 'package:bookverse/src/domain/model/bookmark_model.dart';
import 'package:bookverse/src/domain/model/category_model.dart';
import 'package:bookverse/src/domain/model/comment_model.dart';
import 'package:bookverse/src/domain/model/favorite_model.dart';
import 'package:bookverse/src/domain/model/rating_model.dart';
import 'package:bookverse/src/domain/model/user_model.dart';

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
/// raters : [{"id":1,"email":"vodanh.2901@gmail.com","name":"phuocc","roles":["User"],"permissions":[],"avatarFilePath":"https://ewr1.vultrobjects.com/truyen/avatar/Untitled.png","isEmailConfirmed":true,"updatedDate":"2023-04-10T10:22:13.126Z","deletedAt":null}]
/// ratings : [{"id":1,"value":3}]
/// categories : [{"id":1,"name":"Tiên Hiệp","slug":"tien-hiep","description":"Truyện tiên hiệp thường kể về quá trình tu luyện và khám phá thế giới tu sĩ thần tiên đầy bí ẩn của nhân vật chính."},{"id":9,"name":"Huyền Huyễn","slug":"huyen-huyen","description":"Truyện có những yếu tố huyền bí, khoa học khó giải thích."},{"id":10,"name":"Dị Giới","slug":"di-gioi","description":"Trong truyện có xuất hiện những thế giới kỳ dị, khác với thế giới chúng ta đang sinh sống."},{"id":14,"name":"Xuyên Không","slug":"xuyen-khong","description":"Xuyên Không, Xuyên Việt là thể loại nhân vật chính vì một lý do nào đó mà bị đưa đến sinh sống ở một không gian hay một khoảng thời gian khác.Nhân vật chính có thể trực tiếp xuyên qua bằng thân xác mình hoặc sống lại bằng thân xác người khác."},{"id":16,"name":"Trọng Sinh","slug":"trong-sinh","description":"Đây là thể truyện có nhân vật chính vì một lý do nào đó mà được sống lại sau khi chết đi, thể loại này thường kết hợp với thể loại xuyên không."},{"id":23,"name":"Nữ Cường","slug":"nu-cuong","description":"Truyện nữ cường là thể loại truyện có những nhân vật nữ sở hữu tính cánh mạnh mẽ (có khi hơn cả đàn ông)."},{"id":38,"name":"Khác","slug":"khac","description":"Những truyện không thuộc những thể loại đã có ở Truyện Full sẽ \"được\" nhét vào đây."}]
/// bookmarks : [{"id":1,"updatedDate":"2023-04-06T08:08:37.530Z"}]
/// comments : [{"id":1,"content":"test 2","parentId":null,"updatedDate":"2023-04-06T10:57:12.836Z","deletedAt":null,"replies":[{"id":3,"content":"test 3","parentId":1,"updatedDate":"2023-04-07T06:54:38.719Z","deletedAt":null,"replies":[],"user":{"id":1,"email":"vodanh.2901@gmail.com","name":"phuocc","roles":["User"],"permissions":[],"avatarFilePath":"https://ewr1.vultrobjects.com/truyen/avatar/Untitled.png","isEmailConfirmed":true,"updatedDate":"2023-04-10T10:22:13.126Z","deletedAt":null}},{"id":6,"content":"test 313123asdscd","parentId":1,"updatedDate":"2023-04-14T09:49:12.639Z","deletedAt":null,"replies":[],"user":{"id":1,"email":"vodanh.2901@gmail.com","name":"phuocc","roles":["User"],"permissions":[],"avatarFilePath":"https://ewr1.vultrobjects.com/truyen/avatar/Untitled.png","isEmailConfirmed":true,"updatedDate":"2023-04-10T10:22:13.126Z","deletedAt":null}}],"user":{"id":1,"email":"vodanh.2901@gmail.com","name":"phuocc","roles":["User"],"permissions":[],"avatarFilePath":"https://ewr1.vultrobjects.com/truyen/avatar/Untitled.png","isEmailConfirmed":true,"updatedDate":"2023-04-10T10:22:13.126Z","deletedAt":null}},{"id":2,"content":"test 2","parentId":null,"updatedDate":"2023-04-07T04:43:15.347Z","deletedAt":null,"replies":[],"user":{"id":1,"email":"vodanh.2901@gmail.com","name":"phuocc","roles":["User"],"permissions":[],"avatarFilePath":"https://ewr1.vultrobjects.com/truyen/avatar/Untitled.png","isEmailConfirmed":true,"updatedDate":"2023-04-10T10:22:13.126Z","deletedAt":null}},{"id":4,"content":"test 123123","parentId":null,"updatedDate":"2023-04-14T07:57:00.059Z","deletedAt":null,"replies":[],"user":{"id":1,"email":"vodanh.2901@gmail.com","name":"phuocc","roles":["User"],"permissions":[],"avatarFilePath":"https://ewr1.vultrobjects.com/truyen/avatar/Untitled.png","isEmailConfirmed":true,"updatedDate":"2023-04-10T10:22:13.126Z","deletedAt":null}},{"id":5,"content":"test 111","parentId":null,"updatedDate":"2023-04-14T07:57:50.487Z","deletedAt":null,"replies":[],"user":{"id":1,"email":"vodanh.2901@gmail.com","name":"phuocc","roles":["User"],"permissions":[],"avatarFilePath":"https://ewr1.vultrobjects.com/truyen/avatar/Untitled.png","isEmailConfirmed":true,"updatedDate":"2023-04-10T10:22:13.126Z","deletedAt":null}}]
/// rateCount : 1
/// rateAvg : 3
/// favorite : {"count":1,"isFavorite":false}
/// latestUpdatedDate : "2023-04-21T14:12:38.031Z"

class StoryDetailModel {
  StoryDetailModel({
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
    this.raters,
    this.ratings,
    this.categories,
    this.bookmarks,
    this.comments,
    this.rateCount,
    this.rateAvg,
    this.favorite,
    this.latestUpdatedDate,
  });

  StoryDetailModel.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    author = json['author'];
    slug = json['slug'];
    description = json['description'] != null ? json['description'].cast<String>() : [];
    poster = json['poster'];
    categoryList = json['categoryList'] != null ? json['categoryList'].cast<String>() : [];
    status = json['status'];
    uploadDate = json['uploadDate'] != null ? DateTime.parse(json['uploadDate']).toLocal() : null;
    updatedDate =
        json['updatedDate'] != null ? DateTime.parse(json['updatedDate']).toLocal() : null;
    deletedAt = json['deletedAt'] != null ? DateTime.parse(json['deletedAt']).toLocal() : null;
    if (json['raters'] != null) {
      raters = [];
      json['raters'].forEach((v) {
        raters?.add(UserModel.fromJson(v));
      });
    }
    if (json['ratings'] != null) {
      ratings = [];
      json['ratings'].forEach((v) {
        ratings?.add(RatingModel.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = [];
      json['categories'].forEach((v) {
        categories?.add(CategoryModel.fromJson(v));
      });
    }
    if (json['bookmarks'] != null) {
      bookmarks = [];
      json['bookmarks'].forEach((v) {
        bookmarks?.add(BookmarkModel.fromJson(v));
      });
    }
    if (json['comments'] != null) {
      comments = [];
      json['comments'].forEach((v) {
        comments?.add(CommentModel.fromJson(v));
      });
    }
    rateCount = json['rateCount'];
    rateAvg = json['rateAvg'] * 1.0;
    favorite = json['favorite'] != null ? FavoriteModel.fromJson(json['favorite']) : null;
    latestUpdatedDate = json['latestUpdatedDate'] != null
        ? DateTime.parse(json['latestUpdatedDate']).toLocal()
        : null;
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
  List<UserModel>? raters;
  List<RatingModel>? ratings;
  List<CategoryModel>? categories;
  List<BookmarkModel>? bookmarks;
  List<CommentModel>? comments;
  int? rateCount;
  double? rateAvg;
  FavoriteModel? favorite;
  DateTime? latestUpdatedDate;

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
    if (raters != null) {
      map['raters'] = raters?.map((v) => v.toJson()).toList();
    }
    if (ratings != null) {
      map['ratings'] = ratings?.map((v) => v.toJson()).toList();
    }
    if (categories != null) {
      map['categories'] = categories?.map((v) => v.toJson()).toList();
    }
    if (bookmarks != null) {
      map['bookmarks'] = bookmarks?.map((v) => v.toJson()).toList();
    }
    if (comments != null) {
      map['comments'] = comments?.map((v) => v.toJson()).toList();
    }
    map['rateCount'] = rateCount;
    map['rateAvg'] = rateAvg;
    if (favorite != null) {
      map['favorite'] = favorite?.toJson();
    }
    map['latestUpdatedDate'] = latestUpdatedDate?.toUtc().toIso8601String();
    return map;
  }
}
