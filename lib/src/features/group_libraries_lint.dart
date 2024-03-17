import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

import '../libraries/file_path/file_domain.dart';
import '../libraries/file_path/file_path.dart';

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
    final sourcePath = FilePath.fromAbsolute(resolver.source.fullName);

    if (!sourcePath.isPartOf(FileDomain.libraries)) return;
    if (sourcePath.isGroupedIn(FileDomain.libraries)) return;

    bool reported = false;
    context.registry.addAnnotatedNode((node) {
      if (reported) return;

      reporter.reportErrorForNode(code, node);
      reported = true;
    });
  }
}
