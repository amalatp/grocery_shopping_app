class BannerModel {
  final int id;
  final String imageUrl;

  BannerModel({required this.id, required this.imageUrl});

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'] ?? 0, // Default to 0 if null
      imageUrl: json['image'] ?? "", // Default to empty string if null
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': imageUrl,
    };
  }

  static List<BannerModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => BannerModel.fromJson(json)).toList();
  }
}
