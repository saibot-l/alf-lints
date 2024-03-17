import 'package:example_package_feature/example_package_feature.dart';
import 'package:example_package_library/example_package_library.dart';

import 'src/app/routes.dart';
import 'src/features/a/feature_a.dart';
import 'src/libraries/a/library_a.dart';

class Main {
  final Routes routes;
  final FeatureA featureA;
  final LibraryA libraryA;

  final ExamplePackageFeature examplePackageFeature;
  final ExamplePackageLibrary examplePackageLibrary;

  const Main(
    this.routes,
    this.featureA,
    this.libraryA,
    this.examplePackageFeature,
    this.examplePackageLibrary,
  );
}
