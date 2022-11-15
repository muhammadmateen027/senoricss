// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repositories_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepositoriesDto _$RepositoriesDtoFromJson(Map<String, dynamic> json) =>
    RepositoriesDto(
      repositoryDto: (json['repositories'] as List<dynamic>?)
          ?.map((e) => RepositoryDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

RepositoryDto _$RepositoryDtoFromJson(Map<String, dynamic> json) =>
    RepositoryDto(
      url: json['url'] as String,
      description: json['description'] as String,
      name: json['name'] as String,
      type: json['type'] as String?,
      username: json['username'] as String?,
      owner: json['owner'] as String?,
      homepage: json['homepage'] as String?,
      language: json['language'] as String?,
      watchers: json['watchers'] as int?,
      followers: json['followers'] as int?,
      forks: json['forks'] as int?,
      size: json['size'] as int?,
      openIssues: json['openIssues'] as int?,
      score: (json['score'] as num?)?.toDouble(),
      hasDownloads: json['hasDownloads'] as bool?,
      hasIssues: json['hasIssues'] as bool?,
      hasProjects: json['hasProjects'] as bool?,
      hasWiki: json['hasWiki'] as bool?,
      fork: json['fork'] as bool?,
      private: json['private'] as bool?,
      created: json['created'] as String?,
      createdAt: json['createdAt'] as String?,
      pushedAt: json['pushedAt'] as String?,
      pushed: json['pushed'] as String?,
    );
