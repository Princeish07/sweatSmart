import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

enum DioMethod { post, get, put, delete }

class ApiService {
  ApiService._singleton();

  static final ApiService instance = ApiService._singleton();

  String get baseUrl {
    if (kDebugMode) {
      return 'https://exercisedb.p.rapidapi.com/';
    }

    return 'production url';
  }

  Future<Response> request(String endpoint, DioMethod method,
      {Map<String, dynamic>? param,
      String? contentType,
      formData,
      bool? isAuthenticationRequired,
      String? token}) async {
    try {
      final dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          contentType: contentType ?? Headers.formUrlEncodedContentType,
          headers: isAuthenticationRequired == true
              ? {
                  HttpHeaders.authorizationHeader: 'Bearer $token',
            'X-RapidAPI-Key': 'ee9bedcc81msh62b38e7ec3ec4acp1e6ebcjsnd37269218a77'

                }
              : null,
        ),
      );
      switch (method) {
        case DioMethod.post:
          return dio.post(
            endpoint,
            data: param ?? formData,
          );
        case DioMethod.get:
          return dio.get(
            endpoint,
            queryParameters: param,
          );
        case DioMethod.put:
          return dio.put(
            endpoint,
            data: param ?? formData,
          );
        case DioMethod.delete:
          return dio.delete(
            endpoint,
            data: param ?? formData,
          );
        default:
          return dio.post(
            endpoint,
            data: param ?? formData,
          );
      }
    } catch (e) {
      throw Exception('Network error');
    }
  }
}
