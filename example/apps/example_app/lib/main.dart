import 'package:example_feature/example_feature.dart';
import 'package:example_library/example_library.dart';

import 'src/app/routes.dart';
import 'src/features/a/feature_a.dart';
import 'src/libraries/a/library_a.dart';

class Main {
  final Routes routes;
  final FeatureA featureA;
  final LibraryA libraryA;

  final ExampleFeature exampleFeature;
  final ExampleLibrary exampleLibrary;

  const Main(
    this.routes,
    this.featureA,
    this.libraryA,
    this.exampleFeature,
    this.exampleLibrary,
  );
}
