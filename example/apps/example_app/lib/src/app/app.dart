import 'package:example_package_feature/example_package_feature.dart';
import 'package:example_package_library/example_package_library.dart';

// expect_lint: avoid_import_entry_point
import '../../main.dart';
import '../features/a/feature_a.dart';
import '../libraries/a/library_a.dart';
import 'routes.dart';

class App {
  final Main main;
  final Routes routes;
  final FeatureA featureA;
  final LibraryA libraryA;

  final ExamplePackageFeature examplePackageFeature;
  final ExamplePackageLibrary examplePackageLibrary;

  const App(
    this.main,
    this.routes,
    this.featureA,
    this.libraryA,
    this.examplePackageFeature,
    this.examplePackageLibrary,
  );
}
