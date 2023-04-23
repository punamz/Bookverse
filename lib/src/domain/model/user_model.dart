/// id : 1
/// email : "vodanh.2901@gmail.com"
/// name : "phuocc"
/// roles : ["User"]
/// permissions : []
/// avatarFilePath : "https://ewr1.vultrobjects.com/truyen/avatar/Untitled.png"
/// isEmailConfirmed : true
/// updatedDate : "2023-04-10T10:22:13.126Z"
/// deletedAt : null

class UserModel {
  UserModel({
    this.id,
    this.email,
    this.name,
    this.roles,
    this.permissions,
    this.avatarFilePath,
    this.isEmailConfirmed,
    this.updatedDate,
    this.deletedAt,
  });

  UserModel.fromJson(dynamic json) {
    id = json['id'];
    email = json['email'];
    name = json['name'];
    roles = json['roles'] != null ? json['roles'].cast<String>() : [];
    if (json['permissions'] != null) {
      permissions = [];
      json['permissions'].forEach((v) {
        permissions?.add(v);
      });
    }
    avatarFilePath = json['avatarFilePath'];
    isEmailConfirmed = json['isEmailConfirmed'];
    updatedDate =
        json['updatedDate'] != null ? DateTime.parse(json['updatedDate']).toLocal() : null;
    deletedAt = json['deletedAt'] != null ? DateTime.parse(json['deletedAt']).toLocal() : null;
  }
  int? id;
  String? email;
  String? name;
  List<String>? roles;
  List<dynamic>? permissions;
  String? avatarFilePath;
  bool? isEmailConfirmed;
  DateTime? updatedDate;
  DateTime? deletedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['email'] = email;
    map['name'] = name;
    map['roles'] = roles;
    if (permissions != null) {
      map['permissions'] = permissions?.map((v) => v.toJson()).toList();
    }
    map['avatarFilePath'] = avatarFilePath;
    map['isEmailConfirmed'] = isEmailConfirmed;
    map['updatedDate'] = updatedDate?.toUtc().toIso8601String();
    map['deletedAt'] = deletedAt?.toUtc().toIso8601String();
    return map;
  }
}
