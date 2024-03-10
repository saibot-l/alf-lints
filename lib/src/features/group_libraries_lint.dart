import 'package:alf_lints/src/libraries/file_path/file_domain.dart';
import 'package:alf_lints/src/libraries/file_path/get_relative_package_path.dart';
import 'package:alf_lints/src/libraries/file_path/is_grouped_within_domain.dart';
import 'package:alf_lints/src/libraries/file_path/is_path_of_domain.dart';
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

class GroupLibrariesLint extends DartLintRule {
  const GroupLibrariesLint() : super(code: _code);

  static const _code = LintCode(
    name: 'group_libraries',
    problemMessage: 'Group libraries.',
    correctionMessage: 'Group libraries into folders.',
  );

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    final fullPath = resolver.source.fullName;
    final relativePath = getRelativePackagePath(fullPath);

    if (!isPathOfDomain(relativePath, FileDomain.libraries)) return;
    if (isGroupedWithinDomain(relativePath, FileDomain.libraries)) return;

    bool reported = false;
    context.registry.addAnnotatedNode((node) {
      if (reported) return;

      reporter.reportErrorForNode(code, node);
      reported = true;
    });
  }
}
