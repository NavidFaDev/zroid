
class InfoApi {

  late String telegram;
  late String whatsapp;
  late String linkedin;
  late String website;
  late String english;
  late String cv;
  late String phone;
  late String description;

  InfoApi({required this.telegram, required this.whatsapp, required this.linkedin, required this.website, required this.english, required this.cv, required this.phone, required this.description});

  factory InfoApi.fromJson(Map<String, dynamic> json) => InfoApi(
      telegram: json['telegram'],
      whatsapp: json['whatsapp'],
      linkedin: json['linkedin'],
      website: json['website'],
      english: json["english"],
      cv: json["cv:"],
      phone: json["phone"],
      description: json['description']
  );
}