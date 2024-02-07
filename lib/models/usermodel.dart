import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class UserModel {
  String name;
  String? nick_name;
  String gender;
  DateTime? dob;
  String? college;
  int? year_of_gradutaion;
  String? instaId;
  String? mailId;
  int? phoneNo;
  String? dpUrl;
  UserModel({
    required this.name,
    this.nick_name,
    required this.gender,
    this.dob,
    this.college,
    this.year_of_gradutaion,
    this.instaId,
    this.mailId,
    this.phoneNo,
    this.dpUrl,
  });

  UserModel copyWith({
    String? name,
    String? nick_name,
    String? gender,
    DateTime? dob,
    String? college,
    int? year_of_gradutaion,
    String? instaId,
    String? mailId,
    int? phoneNo,
    String? dpUrl,
  }) {
    return UserModel(
      name: name ?? this.name,
      nick_name: nick_name ?? this.nick_name,
      gender: gender ?? this.gender,
      dob: dob ?? this.dob,
      college: college ?? this.college,
      year_of_gradutaion: year_of_gradutaion ?? this.year_of_gradutaion,
      instaId: instaId ?? this.instaId,
      mailId: mailId ?? this.mailId,
      phoneNo: phoneNo ?? this.phoneNo,
      dpUrl: dpUrl ?? this.dpUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'nick_name': nick_name,
      'gender': gender,
      'dob': dob?.toIso8601String(),
      'college': college,
      'year_of_gradutaion': year_of_gradutaion,
      'instaId': instaId,
      'mailId': mailId,
      'phoneNo': phoneNo,
      'dpUrl': dpUrl,
    };
  }

  factory UserModel.fromMap(map) {
    return UserModel(
      name: map['name'] as String,
      nick_name: map['nick_name'] != null ? map['nick_name'] as String : null,
      gender: map['gender'] as String,
      dob: map['dob'] != null ? DateTime.parse(map['dob'] as String) : null,
      college: map['college'] != null ? map['college'] as String : null,
      year_of_gradutaion: map['year_of_gradutaion'] != null
          ? map['year_of_gradutaion'] as int
          : null,
      instaId: map['instaId'] != null ? map['instaId'] as String : null,
      mailId: map['mailId'] != null ? map['mailId'] as String : null,
      phoneNo: map['phoneNo'] != null ? map['phoneNo'] as int : null,
      dpUrl: map['dpUrl'] != null ? map['dpUrl'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(name: $name, nick_name: $nick_name, gender: $gender, dob: $dob, college: $college, year_of_gradutaion: $year_of_gradutaion, instaId: $instaId, mailId: $mailId, phoneNo: $phoneNo, dpUrl: $dpUrl)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.nick_name == nick_name &&
        other.gender == gender &&
        other.dob == dob &&
        other.college == college &&
        other.year_of_gradutaion == year_of_gradutaion &&
        other.instaId == instaId &&
        other.mailId == mailId &&
        other.phoneNo == phoneNo &&
        other.dpUrl == dpUrl;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        nick_name.hashCode ^
        gender.hashCode ^
        dob.hashCode ^
        college.hashCode ^
        year_of_gradutaion.hashCode ^
        instaId.hashCode ^
        mailId.hashCode ^
        phoneNo.hashCode ^
        dpUrl.hashCode;
  }
}
