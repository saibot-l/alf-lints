import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

import '../libraries/analyzer/import_directive_x.dart';
import '../libraries/file_path/file_domain.dart';
import '../libraries/file_path/file_path.dart';

class AvoidImportFeatureFromOtherFeatureLint extends DartLintRule {
  const AvoidImportFeatureFromOtherFeatureLint() : super(code: _code);

  static const _code = LintCode(
    name: 'avoid_import_feature_from_other_feature',
    problemMessage:
        'Avoid dependencies between features to maintain separation of concerns.',
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
    final feature = sourcePath.nameIn(FileDomain.features);
    if (feature == null) return;

    context.registry.addImportDirective((node) {
      final importPath = FilePath.fromRelative(node.relativePath);
      final importedFeature = importPath.nameIn(FileDomain.features);
      if (importedFeature == null) return;
      if (feature == importedFeature) return;

      reporter.atNode(node, code);
    });
  }
}
