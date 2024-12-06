import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:unipool/features/search_location/domain/models/datasource_model.dart';
import 'package:unipool/features/search_location/domain/models/geoapify_places_model.dart';

@lazySingleton
@immutable
class GeoapifyDataSource {
  final String apiKey;
  final HttpClient _client;

  GeoapifyDataSource({required this.apiKey}) : _client = HttpClient();

  Future<List<GeoapifyPlace>> searchPlaces(String query) async {
    try {
      final queryParameters = {
        'apiKey': apiKey,
        'text': query,
        'lang': 'tr',
        'format': 'json',
        'accept-language': 'tr',
      };

      final uri = Uri.https(
        'api.geoapify.com',
        '/v1/geocode/autocomplete',
        queryParameters,
      );

      final request = await _client.getUrl(uri);
      final response = await request.close();
      final responseBody = await response.transform(utf8.decoder).join();

      if (response.statusCode == 200) {
        final responseModel = GeoapifyResponseModelMapper.fromJson(responseBody);
        return responseModel.results ?? [];
      } else {
        throw Exception('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to fetch places: $e');
    }
  }

  void dispose() {
    _client.close();
  }
}
