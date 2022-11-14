import 'package:senorics/app/app.dart';
import 'package:senorics/bootstrap.dart';

void main() {
  // TODO(muhammadmateen027): initialize the configuration
  /// Create the object for repository and inject the network layer
  /// Inject the laer in App module

  bootstrap(() => const App());
}
