import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

import '../libraries/analyzer/import_directive_x.dart';
import '../libraries/file_path/file_domain.dart';
import '../libraries/file_path/file_path.dart';

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
    final sourcePath = FilePath.fromAbsolute(resolver.source.fullName);
    if (!sourcePath.isPartOf(FileDomain.features)) return;

    context.registry.addImportDirective((node) {
      final importPath = FilePath.fromRelative(node.relativePath);
      if (!importPath.isPartOf(FileDomain.app)) return;

      reporter.reportErrorForNode(code, node);
    });
  }
}
