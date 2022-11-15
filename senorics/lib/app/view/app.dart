import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:senorics/api/api.dart';
import 'package:senorics/github/github.dart';
import 'package:senorics/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key, required this.api});

  final Api api;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFF13B9FF),
        ),
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: BlocProvider<GithubBloc>(
        create: (_) => GithubBloc(api)..add(GithubFetchEvent()),
        child: const GithubPage(),
      ),
    );
  }
}
