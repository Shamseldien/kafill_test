import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'caching_helper.g.dart';

@JsonSerializable()
class CachedData {
  final String key;
  final String data;

  CachedData({required this.key, required this.data});

  factory CachedData.fromJson(Map<String, dynamic> json) =>
      _$CachedDataFromJson(json);

  Map<String, dynamic> toJson() => _$CachedDataToJson(this);
}

class CacheManager {
  final SharedPreferences _prefs;

  CacheManager(this._prefs);

  Future<void> cacheData(String key, dynamic data) async {
    final jsonData = jsonEncode(data);
    final cachedData = CachedData(key: key, data: jsonData);
    final cachedDataJson = cachedData.toJson();
    await _prefs.setString(key, jsonEncode(cachedDataJson));
  }

  Future<T?> getCachedData<T>(String key, T Function(Map<String, dynamic>) fromJson) async {
    final cachedDataJson = _prefs.getString(key);
    if (cachedDataJson != null) {
      final cachedDataMap = jsonDecode(cachedDataJson) as Map<String, dynamic>;
      final cachedData = fromJson(cachedDataMap);
      return cachedData;
    }
    return null;
  }

  Future<void> clearCache(String key) async {
    await _prefs.remove(key);
  }
}
