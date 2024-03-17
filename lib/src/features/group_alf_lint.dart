import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

import '../libraries/file_path/file_domain.dart';
import '../libraries/file_path/file_path.dart';
import '../libraries/utilities/call_once.dart';

class GroupAlfLint extends DartLintRule {
  const GroupAlfLint() : super(code: _code);

  static const _code = LintCode(
    name: 'group_alf',
    problemMessage: '''
Organize files within the "app", "libraries, or "features" folders, or designate them as entry points.
This helps to keep an organized folder structure.
''',
    correctionMessage: '''
Place the file within the appropriate "app", "libraries, or "features" folder, or designate it as an entry point.
Entry points should be prefixed with "main" or named the same as the package and placed directly in the "lib" or "bin" folder.''',
  );

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    final package = context.pubspec.name;
    final sourcePath = FilePath.fromAbsolute(resolver.source.fullName);
    if (sourcePath.isEntryPointOf(package)) return;
    if (sourcePath.isPartOf(FileDomain.features)) return;
    if (sourcePath.isPartOf(FileDomain.libraries)) return;
    if (sourcePath.isPartOf(FileDomain.app)) return;

    final callOnce = CallOnce();
    context.registry.addAnnotatedNode((node) {
      callOnce(
        () => reporter.reportErrorForNode(code, node),
      );
    });
  }
}
