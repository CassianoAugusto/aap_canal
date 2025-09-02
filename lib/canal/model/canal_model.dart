class CanalModel {
  final String showId;
  final String title;
  final String? audienceScore;
  final String criticsScore;
  final String imageUrl;
  final bool isVideo;
  final String? releaseDate;
  final String mediaUrl;

  CanalModel({
    required this.showId,
    required this.title,
    this.audienceScore,
    required this.criticsScore,
    required this.imageUrl,
    required this.isVideo,
    this.releaseDate,
    required this.mediaUrl,
  });

  factory CanalModel.fromJson(Map<String, dynamic> json) {
    return CanalModel(
      showId: json['show_id'],
      title: json['title'],
      audienceScore: json['audience_score'],
      criticsScore: json['critics_score'] ?? "0",
      imageUrl: json['image_url'],
      isVideo: json['is_video'],
      releaseDate: json['release_date'],
      mediaUrl: json['media_url'],
    );
  }
}
