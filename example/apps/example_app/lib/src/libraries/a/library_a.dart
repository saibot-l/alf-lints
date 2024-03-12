// expect_lint: avoid_import_entry_point
import '../../../main.dart';
// expect_lint: avoid_import_app_from_library
import '../../app/pages/page_a.dart';

class LibraryA {
  final Main main;
  final PageA pageA;

  const LibraryA(this.main, this.pageA);
}
