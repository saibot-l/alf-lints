// expect_lint: avoid_import_feature_from_library
import 'package:example_package_feature/example_package_feature.dart';
import 'package:example_package_library/example_package_library.dart';

// expect_lint: avoid_import_entry_point
import '../../../main.dart';
// expect_lint: avoid_import_app_from_library
import '../../app/pages/page_a.dart';
// expect_lint: avoid_import_feature_from_library
import '../../features/a/feature_a.dart';
import '../library_b.dart';

class LibraryA {
  final Main main;
  final PageA pageA;
  final FeatureA featureA;
  final LibraryB libraryB;

  final ExamplePackageFeature examplePackageFeature;
  final ExamplePackageLibrary examplePackageLibrary;

  const LibraryA(
    this.main,
    this.pageA,
    this.featureA,
    this.libraryB,
    this.examplePackageFeature,
    this.examplePackageLibrary,
  );
}
