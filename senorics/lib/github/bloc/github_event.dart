part of 'github_bloc.dart';

@immutable
abstract class GithubEvent {}

class GithubFetchEvent extends GithubEvent {}

class GithubPostEvent extends GithubEvent {}
