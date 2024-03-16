// expect_lint: group_alf
import 'package:example_feature/example_feature.dart';
import 'package:example_library/example_library.dart';

// expect_lint: avoid_import_entry_point
import '../../example_app.dart';
// expect_lint: avoid_import_entry_point
import '../../main.dart';
// expect_lint: avoid_import_entry_point
import '../../main_dev.dart';
import '../app/app.dart';
import '../features/a/feature_a.dart';
import '../libraries/a/library_a.dart';
import '../no_entry_point.dart';

class Other {
  final ExampleApp exampleApp;
  final Main main;
  final MainDev mainDev;
  final NoEntryPoint noEntryPoint;

  final App app;
  final FeatureA featureA;
  final LibraryA libraryA;

  final ExampleFeature exampleFeature;
  final ExampleLibrary exampleLibrary;

  const Other(
    this.exampleApp,
    this.main,
    this.mainDev,
    this.noEntryPoint,
    this.app,
    this.featureA,
    this.libraryA,
    this.exampleFeature,
    this.exampleLibrary,
  );
}
