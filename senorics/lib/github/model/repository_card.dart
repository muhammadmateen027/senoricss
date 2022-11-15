import 'package:meta/meta.dart';

@immutable
class RepositoryCard {
  const RepositoryCard({
    required this.url,
    required this.name,
    required this.description,
    required this.language,
  });

  final String url;
  final String name;
  final String description;
  final String language;

  @override
  bool operator ==(final Object other) =>
      identical(this, other) ||
      other is RepositoryCard &&
          runtimeType == other.runtimeType &&
          url == other.url &&
          description == other.description &&
          language == other.language &&
          name == other.name;

  @override
  int get hashCode =>
      url.hashCode ^ name.hashCode ^ description.hashCode ^ language.hashCode;
}
