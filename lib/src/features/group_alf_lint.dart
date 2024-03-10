import 'package:alf_lints/src/libraries/constants/folders.dart';
import 'package:alf_lints/src/libraries/file_path/get_relative_package_path.dart';
import 'package:alf_lints/src/libraries/file_path/is_entry_point_path.dart';
import 'package:alf_lints/src/libraries/file_path/is_path_of_type.dart';
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

class GroupAlfLint extends DartLintRule {
  const GroupAlfLint() : super(code: _code);

  static const _code = LintCode(
    name: 'group_alf',
    problemMessage: '''
Group files into `app`, `libraries`, `features` folder and some entry point.''',
    correctionMessage: '''
Group files into `app/`, `libraries/`, `features/` folders and some entry point.
Place those folders either at `/lib/` or `/lib/src/`.
Name entry point `main.dart`, `main_<flavor>.dart` or `<package-name>.dart`.''',
  );

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    final fullPath = resolver.source.fullName;
    final relativePath = getRelativePackagePath(fullPath);

    if (isEntryPointPath(fullPath, packageName: context.pubspec.name)) return;
    if (isPathOfType(relativePath, Folders.features)) return;
    if (isPathOfType(relativePath, Folders.libraries)) return;
    if (isPathOfType(relativePath, Folders.app)) return;

    bool reported = false;
    context.registry.addAnnotatedNode((node) {
      if (reported) return;

      reporter.reportErrorForNode(code, node);
      reported = true;
    });
  }
}
