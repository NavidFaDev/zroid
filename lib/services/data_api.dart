
class DataApi {

  late String projectName;
  late String projectDescription;
  late String projectShortDescription;
  late String projectImage;
  late String projectURL;
  late bool isOnGooglePlay;
  late String team;

  DataApi({required this.projectName, required this.projectDescription, required this.projectShortDescription, required this.projectImage, required this.projectURL, required this.isOnGooglePlay, required this.team});


  /*factory DataApi.fromJson(Map<String, dynamic> json) => DataApi(
      projectName: json["title"]['rendered'],
      projectDescription: json["content"]['rendered'],
      projectShortDescription: json["content"]['rendered'].replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), ' ').toString(),
      projectImage: json["_embedded"]['wp:featuredmedia'][0]['media_details']['sizes']['large']['source_url'],
      projectURL: json["link"]

  ); */

  factory DataApi.fromJson(Map<String, dynamic> json) => DataApi(
      projectName: json['title'],
      projectDescription: json['longDescription'],
      projectShortDescription: json['shortDescription'],
      projectImage: json['image'],
      projectURL: json["url"],
      isOnGooglePlay: json['isOnGooglePlay'],
      team: json['team']
  );
}