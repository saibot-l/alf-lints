// expect_lint: avoid_import_entry_point
import '../../../main.dart';
// expect_lint: avoid_import_app_from_feature
import '../../app/pages/page_a.dart';

class FeatureA {
  final Main main;
  final PageA pageA;

  const FeatureA(this.main, this.pageA);
}
