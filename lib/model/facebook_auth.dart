class FacebookAuthModel {
  final String? name;
  final String? email;
  final String? id;
  final FacebookPhotoModel? picture;

  FacebookAuthModel(
      {required this.name,
      required this.email,
      required this.id,
      required this.picture});

  factory FacebookAuthModel.fromJson(Map<String, dynamic> json) =>
      FacebookAuthModel(
          name: json['name'],
          email: json['email'],
          id: json['id'],
          picture: FacebookPhotoModel.fromJson(
            json['picture']['data'],
          ));
}

class FacebookPhotoModel {
  final int height;
  final int width;
  final String url;

  FacebookPhotoModel(
      {required this.height, required this.width, required this.url});

  factory FacebookPhotoModel.fromJson(Map<String, dynamic> json) =>
      FacebookPhotoModel(
        height: json['height'],
        width: json['width'],
        url: json['url'],
      );
}
