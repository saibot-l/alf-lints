import 'package:custom_lint_builder/custom_lint_builder.dart';

import 'src/features/avoid_import_app_from_feature_lint.dart';
import 'src/features/avoid_import_app_from_library_lint.dart';
import 'src/features/avoid_import_entry_point_lint.dart';
import 'src/features/group_alf_lint.dart';
import 'src/features/group_libraries_lint.dart';

PluginBase createPlugin() => _AlfLinter();

class _AlfLinter extends PluginBase {
  @override
  List<LintRule> getLintRules(CustomLintConfigs configs) => [
        AvoidImportAppFromFeatureLint(),
        AvoidImportAppFromLibraryLint(),
        AvoidImportEntryPointLint(),
        GroupAlfLint(),
        GroupLibrariesLint(),
      ];
}
