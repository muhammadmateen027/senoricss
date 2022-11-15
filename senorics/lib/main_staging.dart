import 'package:senorics/app/app.dart';
import 'package:senorics/bootstrap.dart';
import 'package:senorics/configuration/configuration.dart';

void main() {
  bootstrap(() async => App(api: await Configuration.initApi()));
}
