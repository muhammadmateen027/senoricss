import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:senorics/api/api.dart';
import 'package:senorics/api/api_assertion.dart';
import 'package:senorics/api/dto/repositories_dto.dart';

typedef DioResponseType = dynamic;

@immutable
class ApiImpl implements Api {
  const ApiImpl(
    this.dio,
    this.domain, [
    this.assertions = const ApiAssertions(),
  ]);

  final Dio dio;
  final String domain;
  final ApiAssertions assertions;

  String get _hostname => 'https://$domain';

  @override
  Future<List<RepositoryDto>> fetchRepositories() async {
    final url =
        '$_hostname/legacy/repos/search/:keyword?sort=stars&language=Dart';

    final response = await dio.getUri<DioResponseType>(Uri.parse(url));

    assertions.assertResponse(response);

    return RepositoriesDto.fromJson(response.data as Map<String, dynamic>)
            .repositoryDto ??
        [];
  }

  @override
  Future<RepositoryDto?> fetchRepositoryDetail() {
    // TODO(muhammadmateen027): implement fetchRepositoryDetail
    throw UnimplementedError();
  }
}
