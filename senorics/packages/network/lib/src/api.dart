import 'package:dio/dio.dart';
import 'package:network/network.dart';

///
typedef DioResponseType = dynamic;

///
enum RequestType {
  ///
  get,
}

///
class Api {
  /// Network client required dio as a parameter after initializing
  const Api({required this.dio, required this.clientId});

  ///
  final Dio dio;

  ///
  final String clientId;

  ///
  Future<NetworkResponse?> apiCall({
    required String url,
    RequestType requestType = RequestType.get,
  }) async {
    late Response<DioResponseType> result;

    try {
      switch (requestType) {
        case RequestType.get:
          result = await dio.get<DioResponseType>(url);
          break;
      }

      return NetworkResponse.success(result.data as Map<String, dynamic>);
    } on OnDioError catch (error) {
      return NetworkResponse.error(error.message);
    } catch (error) {
      return NetworkResponse.error(error.toString());
    }
  }
}
