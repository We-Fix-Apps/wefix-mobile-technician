class SupportParams {
  final String? name;
  final String? mobile;
  final String? email;
  final String? note;

  SupportParams({this.name, this.mobile, this.email, this.note});

  SupportParams.fromJson(Map<String, dynamic> json)
    : name = json['Name'] as String?,
      mobile = json['Mobile'] as String?,
      email = json['Email'] as String?,
      note = json['Note'] as String?;

  Map<String, dynamic> toJson() => {'Name': name, 'Mobile': mobile, 'Email': email, 'Note': note};
}
