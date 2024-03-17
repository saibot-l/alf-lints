import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

import '../libraries/analyzer/import_directive_x.dart';
import '../libraries/file_path/file_path.dart';

class AvoidImportEntryPointLint extends DartLintRule {
  const AvoidImportEntryPointLint() : super(code: _code);

  static const _code = LintCode(
    name: 'avoid_import_entry_point',
    problemMessage: 'Avoid entry point import.',
    correctionMessage: 'Only import from `app`, `libraries` or `features`.',
  );

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    final package = context.pubspec.name;

    context.registry.addImportDirective((node) {
      final importPath = FilePath.fromAbsolute(node.absolutePath);
      if (node.isExternalPackageImport) return;
      if (!importPath.isEntryPointOf(package)) return;

      reporter.reportErrorForNode(code, node);
    });
  }
}
