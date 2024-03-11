import 'package:alf_lints/src/libraries/analyzer/import_directive_x.dart';
import 'package:alf_lints/src/libraries/file_path/file_domain.dart';
import 'package:alf_lints/src/libraries/file_path/get_relative_package_path.dart';
import 'package:alf_lints/src/libraries/file_path/is_path_of_domain.dart';
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

class AvoidImportAppFromFeatureLint extends DartLintRule {
  const AvoidImportAppFromFeatureLint() : super(code: _code);

  static const _code = LintCode(
    name: 'avoid_import_app_from_feature',
    problemMessage: 'Avoid app import from feature.',
    correctionMessage: '''
Consider extracting the referenced code into the current feature or a shared library.''',
  );

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    final fullPath = resolver.source.fullName;
    final relativePath = getRelativePackagePath(fullPath);

    if (!isPathOfDomain(relativePath, FileDomain.features)) return;

    context.registry.addImportDirective((node) {
      final importPath = node.relativePath;

      if (!isPathOfDomain(importPath, FileDomain.app)) return;

      reporter.reportErrorForNode(code, node);
    });
  }
}
