import 'package:json_annotation/json_annotation.dart';

part 'detailgame.g.dart';

@JsonSerializable()
class MinimumSystemRequirements {
  final String os;
  final String processor;
  final String memory;
  final String graphics;
  final String storage;

  MinimumSystemRequirements({required this.os, required this.processor, required this.memory, required this.graphics, required this.storage});

  factory MinimumSystemRequirements.fromJson(Map<String, dynamic> json) => _$MinimumSystemRequirementsFromJson(json);

  Map<String, dynamic> toJson() => _$MinimumSystemRequirementsToJson(this);
}

@JsonSerializable()
class Screenshot {
  final int id;
  final String image;

  Screenshot({required this.id, required this.image});

  factory Screenshot.fromJson(Map<String, dynamic> json) => _$ScreenshotFromJson(json);

  Map<String, dynamic> toJson() => _$ScreenshotToJson(this);
}

@JsonSerializable()
class Detailgame {
  final int id;
  final String title;
  final String thumbnail;
  final String status;
  final String shortDescription;
  final String description;
  final String genre;
  final String platform;
  final String publisher;
  final String developer;
  final String releaseDate;
  final String freetogameProfileUrl;
  final MinimumSystemRequirements? minimumSystemRequirements;
  final List<Screenshot> screenshots;

  Detailgame({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.status,
    required this.shortDescription,
    required this.description,
    required this.genre,
    required this.platform,
    required this.publisher,
    required this.developer,
    required this.releaseDate,
    required this.freetogameProfileUrl,
    this.minimumSystemRequirements,
    required this.screenshots,
  });

  factory Detailgame.fromJson(Map<String, dynamic> json) => _$DetailgameFromJson(json);

  Map<String, dynamic> toJson() => _$DetailgameToJson(this);
}
