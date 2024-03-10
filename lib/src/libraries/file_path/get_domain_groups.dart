import 'package:alf_lints/src/libraries/file_path/file_domain.dart';
import 'package:alf_lints/src/libraries/file_path/is_path_of_domain.dart';

/// Returns the domain groups determined by the [relativePath] and the [domain]'s path.
/// Returns an empty array if the [domain] does not exist for teh given [relativePath].
/// Examples:
/// - `features/example_feature.dart` for domain `features` would return ["example_feature.dart"]
/// - `features/a/b/c/example_feature.dart` for domain `features` would return an array consisting of "a", "b", "c" and "example_feature.dart"
/// - `features/a/b/c/example_feature.dart` for domain `libraries` would return an empty array
List<String> getDomainGroups(String? relativePath, FileDomain domain) {
  if (relativePath == null) return [];
  if (!isPathOfDomain(relativePath, domain)) return [];
  return relativePath.split(domain.path).last.split('/');
}
