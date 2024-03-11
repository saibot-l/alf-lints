import 'package:alf_lints/src/features/avoid_import_app_from_feature_lint.dart';
import 'package:alf_lints/src/features/group_alf_lint.dart';
import 'package:alf_lints/src/features/group_libraries_lint.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

PluginBase createPlugin() => _AlfLinter();

class _AlfLinter extends PluginBase {
  @override
  List<LintRule> getLintRules(CustomLintConfigs configs) => [
        AvoidImportAppFromFeatureLint(),
        GroupAlfLint(),
        GroupLibrariesLint(),
      ];
}
