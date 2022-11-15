import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:senorics/api/api.dart';
import 'package:senorics/github/github.dart';
import 'package:senorics/utils/converter.dart';

part 'github_event.dart';

part 'github_state.dart';

class GithubBloc extends Bloc<GithubEvent, GithubState> {
  GithubBloc(this.api) : super(const GithubState()) {
    on<GithubFetchEvent>(_onGithubFetchEvent);
  }

  final Api api;

  Future<void> _onGithubFetchEvent(
    GithubFetchEvent event,
    Emitter<GithubState> emit,
  ) async {
    const converter = DtoConverter();
    final response = await api.fetchRepositories();
    final convertedCards = await converter.convertRepositoryCard(response);

    emit(state.copyWith(repos: convertedCards));
  }
}
