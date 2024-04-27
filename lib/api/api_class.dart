import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart' as htmlparser;
import 'package:uplash_task/dio_exception.dart';

import '../api_client.dart';

class _Endpoints {
  static const photos = '/photos';
}

class UnSplashApi {
  Future<Map<String, dynamic>> fetchAllPhotos() async {
    try {
      final response = await dio.get(
        _Endpoints.photos,
      );
      debugPrint('${response.data}');
      // Parse the HTML response
      if (response.data != null) {
        final doc = htmlparser.parse(response.data.toString());
        debugPrint('decoded  :$doc');

        // Extract specific elements from the HTML using conditional access operators
        String title = doc.querySelector('title')?.text ?? 'Default Title';
        String divElement =
            doc.querySelector('div.hhXC4')?.text ?? 'Default Title';
        // Find the <script> tag with type "application/ld+json"
        var scriptElement =
            doc.querySelector('script[type="application/ld+json"]')?.text ?? '';

        Map<String, dynamic> jsonData = jsonDecode(scriptElement);

        // Extract the "name" field from the JSON data
        String name = jsonData['name'] ?? 'Myphuong Santosss';

        debugPrint('Name: $name');

        debugPrint('element $title');
        debugPrint('divelement $divElement');
        // Create a JSON object
        Map<String, dynamic> responseData = {
          'title': title,
          'divElement': divElement,
          'name': name,
        };

        debugPrint("jsonData :$responseData");
        return responseData;
      } else {
        throw 'Error in dataFetching';
      }
    } on DioException catch (err) {
      // Dio exception handling
      final errorMessage = NetworkException.fromDioError(err).toString();
      debugPrint('Photos api ${err.message}');
      throw errorMessage;
    } catch (e) {
      debugPrint('Photos api catch $e');
      throw e.toString();
    }
  }
}
