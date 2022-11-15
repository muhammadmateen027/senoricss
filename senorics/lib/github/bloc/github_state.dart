part of 'github_bloc.dart';

enum LoadingStatus {
  initial,
  loading,
  failure,
  loaded,
}

@immutable
class GithubState {
  const GithubState({
    this.repos = const <RepositoryCard>[],
    this.status = LoadingStatus.initial,
  });

  GithubState copyWith({
    final List<RepositoryCard>? repos,
    final LoadingStatus? status,
  }) {
    return GithubState(
      repos: repos ?? this.repos,
      status: status ?? this.status,
    );
  }

  final List<RepositoryCard> repos;
  final LoadingStatus status;
}

extension LoadingStatusX on LoadingStatus {
  bool isLoading() => this == LoadingStatus.loading;

  bool hasFailed() => this == LoadingStatus.failure;
}
