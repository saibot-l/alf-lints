import '../file_domain.dart';
import 'is_path_of_domain.dart';

List<String> getDomainGroups(String? relativePath, FileDomain domain) {
  if (relativePath == null) return [];
  if (!isPathOfDomain(relativePath, domain)) return [];
  return relativePath
      .replaceAll(RegExp(r'\.dart$'), '')
      .split(domain.path)
      .last
      .split('/');
}
