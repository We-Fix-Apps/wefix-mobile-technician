class JobApplicationParams {
  final String? name;
  final String? mobile;
  final String? email;
  final String? address;
  final String? age;
  final String? profession;
  final String? about;
  final String? image;
  final String? aboutVoice;
  final String? cv;

  JobApplicationParams({this.name, this.mobile, this.email, this.address, this.age, this.profession, this.about, this.image, this.aboutVoice, this.cv});

  JobApplicationParams.fromJson(Map<String, dynamic> json)
    : name = json['Name'] as String?,
      mobile = json['Mobile'] as String?,
      email = json['Email'] as String?,
      address = json['Address'] as String?,
      age = json['Age'] as String?,
      profession = json['Profession'] as String?,
      about = json['About'] as String?,
      image = json['Image'] as String?,
      aboutVoice = json['AboutVoice'] as String?,
      cv = json['Cv'] as String?;

  Map<String, dynamic> toJson() => {
    'Name': name,
    'Mobile': mobile,
    'Email': email,
    'Address': address,
    'Age': age,
    'Profession': profession,
    'About': about,
    'Image': image,
    'AboutVoice': aboutVoice,
    'Cv': cv,
  };
}
