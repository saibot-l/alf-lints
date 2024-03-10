import 'package:alf_lints/src/libraries/file_path/file_domain.dart';
import 'package:alf_lints/src/libraries/file_path/is_path_of_domain.dart';

List<String> getDomainGroups(String? relativePath, FileDomain domain) {
  if (relativePath == null) return [];
  if (!isPathOfDomain(relativePath, domain)) return [];
  return relativePath.split(domain.path).last.split('/');
}
