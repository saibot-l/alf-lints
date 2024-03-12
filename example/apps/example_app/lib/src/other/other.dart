// expect_lint: avoid_import_entry_point, group_alf
import '../../example_app.dart';
// expect_lint: avoid_import_entry_point
import '../../main.dart';
// expect_lint: avoid_import_entry_point
import '../../main_dev.dart';
import '../no_entry_point.dart';

class Other {
  final ExampleApp exampleApp;
  final Main main;
  final MainDev mainDev;
  final NoEntryPoint noEntryPoint;

  const Other(this.exampleApp, this.main, this.mainDev, this.noEntryPoint);
}
