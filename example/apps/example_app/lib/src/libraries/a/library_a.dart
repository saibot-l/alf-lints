// expect_lint: avoid_import_app_from_library
import '../../app/pages/page_a.dart';

class LibraryA {
  final PageA pageA;

  LibraryA(this.pageA);
}
