// expect_lint: avoid_import_app_from_feature
import 'package:example_app/src/app/pages/page_a.dart';

class FeatureA {
  final PageA pageA;

  const FeatureA(this.pageA);
}
