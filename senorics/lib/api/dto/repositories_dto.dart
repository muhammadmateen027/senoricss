import 'package:json_annotation/json_annotation.dart';

part 'repositories_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class RepositoriesDto {
  RepositoriesDto({this.repositoryDto});

  factory RepositoriesDto.fromJson(Map<String, dynamic> json) =>
      _$RepositoriesDtoFromJson(json);

  @JsonKey(name: 'repositories')
  List<RepositoryDto>? repositoryDto;
}

@JsonSerializable()
class RepositoryDto {
  RepositoryDto({
    required this.url,
    required this.description,
    required this.name,
    this.type,
    this.username,
    this.owner,
    this.homepage,
    this.language,
    this.watchers,
    this.followers,
    this.forks,
    this.size,
    this.openIssues,
    this.score,
    this.hasDownloads,
    this.hasIssues,
    this.hasProjects,
    this.hasWiki,
    this.fork,
    this.private,
    this.created,
    this.createdAt,
    this.pushedAt,
    this.pushed,
  });

  factory RepositoryDto.fromJson(Map<String, dynamic> json) =>
      _$RepositoryDtoFromJson(json);

  String? type;
  String? username;
  String name;
  String? owner;
  String? homepage;
  String description;
  String? language;
  int? watchers;
  int? followers;
  int? forks;
  int? size;
  int? openIssues;
  double? score;
  bool? hasDownloads;
  bool? hasIssues;
  bool? hasProjects;
  bool? hasWiki;
  bool? fork;
  bool? private;
  String url;
  String? created;
  String? createdAt;
  String? pushedAt;
  String? pushed;
}
