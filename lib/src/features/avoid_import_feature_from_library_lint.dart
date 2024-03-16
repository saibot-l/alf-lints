import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

import '../libraries/analyzer/import_directive_x.dart';
import '../libraries/file_path/file_domain.dart';
import '../libraries/file_path/get_relative_package_path.dart';
import '../libraries/file_path/get_main_domain_group.dart';
import '../libraries/file_path/is_grouped_within_domain.dart';

class AvoidImportFeatureFromLibraryLint extends DartLintRule {
  const AvoidImportFeatureFromLibraryLint() : super(code: _code);

  static const _code = LintCode(
    name: 'avoid_import_feature_from_library',
    problemMessage: 'Avoid feature import from library.',
    correctionMessage: '''
Consider extracting the referenced code into a shared library.''',
  );

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    final fullPath = resolver.source.fullName;
    final relativePath = getRelativePackagePath(fullPath);

    if (!isGroupedWithinDomain(relativePath, FileDomain.libraries)) return;

    context.registry.addImportDirective((node) {
      final importedFeature =
          getMainDomainGroup(node.relativePath, FileDomain.features);

      if (importedFeature == null) return;

      reporter.reportErrorForNode(code, node);
    });
  }
}
