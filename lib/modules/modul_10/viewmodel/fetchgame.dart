import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:praktikum_mobile_1/modules/modul_10/model/game.dart';

Future<List<Game>> fetchGames() async {
  final response = await http.get(Uri.parse('https://www.freetogame.com/api/games'));

  if (response.statusCode == 200) {
    final List<dynamic> jsonData = json.decode(response.body);
    return jsonData.map((item) => Game.fromJson(item)).toList();
  } else {
    throw Exception('Failed to load games');
  }
}

Future<Map<String, dynamic>> fetchDataFromAPI(int idGame) async {
  final response = await http.get(Uri.parse('https://www.freetogame.com/api/game?id=$idGame'));

  if (response.statusCode == 200) {
    final dynamic decoded = json.decode(response.body);
    if (decoded == null || decoded is! Map<String, dynamic>) {
      throw Exception('Invalid data format from API');
    }

    // Normalize null values for String fields to avoid `null` cast errors
    final Map<String, dynamic> jsonData = Map<String, dynamic>.from(decoded);

    // Helper to coerce possibly-null values to non-null Strings
    String _asString(Object? v) {
      if (v == null) return 'N/A';
      if (v is String) return v;
      return v.toString();
    }

    // Normalize top-level known string fields
    final List<String> stringFields = [
      'title',
      'thumbnail',
      'status',
      'shortDescription',
      'description',
      'genre',
      'platform',
      'publisher',
      'developer',
      'releaseDate',
      'freetogameProfileUrl',
    ];

    for (final key in stringFields) {
      if (jsonData.containsKey(key)) {
        jsonData[key] = _asString(jsonData[key]);
      }
    }

    // The API may use different snake_case keys; normalize those too
    final Map<String, String> altKeys = {'short_description': 'shortDescription', 'release_date': 'releaseDate', 'game_url': 'freetogameProfileUrl'};
    altKeys.forEach((oldKey, newKey) {
      if (jsonData.containsKey(oldKey) && !jsonData.containsKey(newKey)) {
        jsonData[newKey] = _asString(jsonData[oldKey]);
      }
    });

    // Normalize minimum_system_requirements object if present
    if (jsonData.containsKey('minimum_system_requirements') && jsonData['minimum_system_requirements'] != null) {
      final msr = Map<String, dynamic>.from(jsonData['minimum_system_requirements']);
      msr['os'] = _asString(msr['os']);
      msr['processor'] = _asString(msr['processor']);
      msr['memory'] = _asString(msr['memory']);
      msr['graphics'] = _asString(msr['graphics']);
      msr['storage'] = _asString(msr['storage']);
      jsonData['minimumSystemRequirements'] = msr;
    } else {
      // ensure the key exists as null (Detailgame.fromJson expects nullable)
      jsonData['minimumSystemRequirements'] = null;
    }

    // Normalize screenshots array: ensure it's a List<Map<String,dynamic>>
    if (jsonData.containsKey('screenshots') && jsonData['screenshots'] != null) {
      try {
        final rawList = jsonData['screenshots'] as List<dynamic>;
        jsonData['screenshots'] =
            rawList.map((e) {
              if (e is Map<String, dynamic>) return e;
              if (e is Map) return Map<String, dynamic>.from(e);
              return {'id': 0, 'image': _asString(e)};
            }).toList();
      } catch (_) {
        jsonData['screenshots'] = <Map<String, dynamic>>[];
      }
    } else {
      jsonData['screenshots'] = <Map<String, dynamic>>[];
    }

    return jsonData;
  } else {
    throw Exception('Failed to load game detail');
  }
}
