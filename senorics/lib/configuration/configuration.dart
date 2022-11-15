import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:senorics/api/api.dart';
import 'package:senorics/api/dio/api.dart';

class Configuration {
  static Future<Api> initApi() async {
    WidgetsFlutterBinding.ensureInitialized();

    // Load environment file
    await dotenv.load();

    return ApiImpl(Dio(), dotenv.env['BASE_URL'] ?? '');
  }
}
