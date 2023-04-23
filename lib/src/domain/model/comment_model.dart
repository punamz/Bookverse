import 'package:bookverse/src/domain/model/user_model.dart';

/// id : 1
/// content : "test 2"
/// parentId : null
/// updatedDate : "2023-04-06T10:57:12.836Z"
/// deletedAt : null
/// replies : [{"id":3,"content":"test 3","parentId":1,"updatedDate":"2023-04-07T06:54:38.719Z","deletedAt":null,"replies":[],"user":{"id":1,"email":"vodanh.2901@gmail.com","name":"phuocc","roles":["User"],"permissions":[],"avatarFilePath":"https://ewr1.vultrobjects.com/truyen/avatar/Untitled.png","isEmailConfirmed":true,"updatedDate":"2023-04-10T10:22:13.126Z","deletedAt":null}},{"id":6,"content":"test 313123asdscd","parentId":1,"updatedDate":"2023-04-14T09:49:12.639Z","deletedAt":null,"replies":[],"user":{"id":1,"email":"vodanh.2901@gmail.com","name":"phuocc","roles":["User"],"permissions":[],"avatarFilePath":"https://ewr1.vultrobjects.com/truyen/avatar/Untitled.png","isEmailConfirmed":true,"updatedDate":"2023-04-10T10:22:13.126Z","deletedAt":null}}]
/// user : {"id":1,"email":"vodanh.2901@gmail.com","name":"phuocc","roles":["User"],"permissions":[],"avatarFilePath":"https://ewr1.vultrobjects.com/truyen/avatar/Untitled.png","isEmailConfirmed":true,"updatedDate":"2023-04-10T10:22:13.126Z","deletedAt":null}

class CommentModel {
  CommentModel({
    this.id,
    this.content,
    this.parentId,
    this.updatedDate,
    this.deletedAt,
    this.replies,
    this.user,
  });

  CommentModel.fromJson(dynamic json) {
    id = json['id'];
    content = json['content'];
    parentId = json['parentId'];
    updatedDate =
        json['updatedDate'] != null ? DateTime.parse(json['updatedDate']).toLocal() : null;
    deletedAt = json['deletedAt'] != null ? DateTime.parse(json['deletedAt']).toLocal() : null;
    if (json['replies'] != null) {
      replies = [];
      json['replies'].forEach((v) {
        replies?.add(CommentModel.fromJson(v));
      });
    }
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
  }
  int? id;
  String? content;
  int? parentId;
  DateTime? updatedDate;
  DateTime? deletedAt;
  List<CommentModel>? replies;
  UserModel? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['content'] = content;
    map['parentId'] = parentId;
    map['updatedDate'] = updatedDate?.toUtc().toIso8601String();
    map['deletedAt'] = deletedAt?.toUtc().toIso8601String();
    if (replies != null) {
      map['replies'] = replies?.map((v) => v.toJson()).toList();
    }
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }
}
