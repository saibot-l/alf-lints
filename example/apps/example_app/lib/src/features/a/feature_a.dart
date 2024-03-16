// expect_lint: avoid_import_entry_point
import '../../../main.dart';
// expect_lint: avoid_import_app_from_feature
import '../../app/pages/page_a.dart';
// expect_lint: avoid_import_feature_from_other_feature
import '../b/feature_b.dart';

class FeatureA {
  final Main main;
  final PageA pageA;
  final FeatureB featureB;

  const FeatureA(this.main, this.pageA, this.featureB);
}
