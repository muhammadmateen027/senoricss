import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senorics/github/bloc/github_bloc.dart';
import 'package:senorics/l10n/l10n.dart';

class GithubPage extends StatelessWidget {
  const GithubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.githubAppBarTitle),
      ),
      body: BlocBuilder<GithubBloc, GithubState>(
        builder: (_, state) {
          if (state.status.isLoading()) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            itemCount: state.repos.length,
            itemBuilder: (_, index) {
              return ListTile(
                title: Text(state.repos[index].name),
              );
            },
          );
        },
      ),
    );
  }
}
