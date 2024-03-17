// expect_lint: avoid_import_feature_from_other_feature
import 'package:example_package_feature/example_package_feature.dart';
import 'package:example_package_library/example_package_library.dart';

// expect_lint: avoid_import_entry_point
import '../../../main.dart';
// expect_lint: avoid_import_app_from_feature
import '../../app/pages/page_a.dart';
import '../../libraries/a/library_a.dart';
// expect_lint: avoid_import_feature_from_other_feature
import '../b/feature_b.dart';

class FeatureA {
  final Main main;
  final PageA pageA;
  final FeatureB featureB;
  final LibraryA libraryA;

  final ExamplePackageFeature examplePackageFeature;
  final ExamplePackageLibrary examplePackageLibrary;

  const FeatureA(
    this.main,
    this.pageA,
    this.featureB,
    this.libraryA,
    this.examplePackageFeature,
    this.examplePackageLibrary,
  );
}
