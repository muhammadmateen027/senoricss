import 'package:senorics/api/dto/repositories_dto.dart';

///
abstract class Api {
  Future<List<RepositoryDto>> fetchRepositories();
  Future<RepositoryDto?> fetchRepositoryDetail();
}
