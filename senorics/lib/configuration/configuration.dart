import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:network/network.dart';

class Configuration {
  // check either it's debug or release mode
  static const bool enableLogging = !kDebugMode;

  static Future<Api> initApi() async {
    WidgetsFlutterBinding.ensureInitialized();

    // Load environment file
    await dotenv.load();

    /// initialize and setup interceptors for the network calls
    final _dio = Dio(
      BaseOptions(baseUrl: dotenv.env['BASE_URL']!),
    );

    _dio.interceptors.addAll({
      DioLogger(requestHeader: true, requestBody: true),
      ErrorInterceptors(_dio),
    });

    /// initialize the network layer
    return Api(dio: _dio);
  }
}
