// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detailgame.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MinimumSystemRequirements _$MinimumSystemRequirementsFromJson(
  Map<String, dynamic> json,
) => MinimumSystemRequirements(
  os: json['os'] as String,
  processor: json['processor'] as String,
  memory: json['memory'] as String,
  graphics: json['graphics'] as String,
  storage: json['storage'] as String,
);

Map<String, dynamic> _$MinimumSystemRequirementsToJson(
  MinimumSystemRequirements instance,
) => <String, dynamic>{
  'os': instance.os,
  'processor': instance.processor,
  'memory': instance.memory,
  'graphics': instance.graphics,
  'storage': instance.storage,
};

Screenshot _$ScreenshotFromJson(Map<String, dynamic> json) =>
    Screenshot(id: (json['id'] as num).toInt(), image: json['image'] as String);

Map<String, dynamic> _$ScreenshotToJson(Screenshot instance) =>
    <String, dynamic>{'id': instance.id, 'image': instance.image};

Detailgame _$DetailgameFromJson(Map<String, dynamic> json) => Detailgame(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  thumbnail: json['thumbnail'] as String,
  status: json['status'] as String,
  shortDescription: json['shortDescription'] as String,
  description: json['description'] as String,
  genre: json['genre'] as String,
  platform: json['platform'] as String,
  publisher: json['publisher'] as String,
  developer: json['developer'] as String,
  releaseDate: json['releaseDate'] as String,
  freetogameProfileUrl: json['freetogameProfileUrl'] as String,
  minimumSystemRequirements:
      json['minimumSystemRequirements'] == null
          ? null
          : MinimumSystemRequirements.fromJson(
            json['minimumSystemRequirements'] as Map<String, dynamic>,
          ),
  screenshots:
      (json['screenshots'] as List<dynamic>)
          .map((e) => Screenshot.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$DetailgameToJson(Detailgame instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'thumbnail': instance.thumbnail,
      'status': instance.status,
      'shortDescription': instance.shortDescription,
      'description': instance.description,
      'genre': instance.genre,
      'platform': instance.platform,
      'publisher': instance.publisher,
      'developer': instance.developer,
      'releaseDate': instance.releaseDate,
      'freetogameProfileUrl': instance.freetogameProfileUrl,
      'minimumSystemRequirements': instance.minimumSystemRequirements,
      'screenshots': instance.screenshots,
    };
