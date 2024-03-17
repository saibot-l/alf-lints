import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

import '../libraries/file_path/file_domain.dart';
import '../libraries/file_path/file_path.dart';

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
    final package = context.pubspec.name;
    final sourcePath = FilePath.fromAbsolute(resolver.source.fullName);
    if (sourcePath.isEntryPointOf(package)) return;
    if (sourcePath.isPartOf(FileDomain.features)) return;
    if (sourcePath.isPartOf(FileDomain.libraries)) return;
    if (sourcePath.isPartOf(FileDomain.app)) return;

    bool reported = false;
    context.registry.addAnnotatedNode((node) {
      if (reported) return;

      reporter.reportErrorForNode(code, node);
      reported = true;
    });
  }
}
