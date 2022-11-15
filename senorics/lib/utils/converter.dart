import 'package:meta/meta.dart';
import 'package:senorics/api/dto/dto.dart';
import 'package:senorics/github/github.dart';

@immutable
class DtoConverter {
  const DtoConverter();

  Future<List<RepositoryCard>> convertRepositoryCard(
    final List<RepositoryDto> repositoriesDto,
  ) async {
    final list = <RepositoryCard>[];

    for (final card in repositoriesDto) {
      list.add(card.toRepositoryCard());
    }

    return list;
  }
}

extension on RepositoryDto {
  RepositoryCard toRepositoryCard() {
    return RepositoryCard(
      name: name,
      url: url,
      description: description,
      language: language ?? '',
    );
  }
}
