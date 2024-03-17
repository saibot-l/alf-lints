import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

import '../libraries/analyzer/import_directive_x.dart';
import '../libraries/file_path/file_domain.dart';
import '../libraries/file_path/file_path.dart';

class AvoidImportFeatureFromLibraryLint extends DartLintRule {
  const AvoidImportFeatureFromLibraryLint() : super(code: _code);

  static const _code = LintCode(
    name: 'avoid_import_feature_from_library',
    problemMessage: '''
Avoid importing features from libraries.
Features typically depend on libraries and could tend to circular dependencies when imported by a library.''',
    correctionMessage: '''
Refactor to not depend on the feature.
Consider putting shared functionality into a shared library.''',
  );

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    final sourcePath = FilePath.fromAbsolute(resolver.source.fullName);
    if (!sourcePath.isGroupedIn(FileDomain.libraries)) return;

    context.registry.addImportDirective((node) {
      final importPath = FilePath.fromRelative(node.relativePath);
      final importedFeature = importPath.nameIn(FileDomain.features);
      if (importedFeature == null) return;

      reporter.reportErrorForNode(code, node);
    });
  }
}
