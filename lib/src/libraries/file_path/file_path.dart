import 'file_domain.dart';
import 'utilities/get_main_domain_group.dart';
import 'utilities/get_relative_package_path.dart';
import 'utilities/is_entry_point_path.dart';
import 'utilities/is_grouped_within_domain.dart';
import 'utilities/is_path_of_domain.dart';

class FilePath {
  final String? absolutePath;
  final String? relativePath;

  const FilePath._({
    this.absolutePath,
    this.relativePath,
  });

  factory FilePath.fromAbsolute(String? path) => FilePath._(
        absolutePath: path,
        relativePath: getRelativePackagePath(path),
      );

  factory FilePath.fromRelative(String? path) => FilePath._(
        absolutePath: null,
        relativePath: path,
      );

  bool isEntryPointOf(String package) =>
      isEntryPointPath(absolutePath, packageName: package);

  bool isGroupedIn(FileDomain domain) =>
      isGroupedWithinDomain(relativePath, domain);

  bool isPartOf(FileDomain domain) => isPathOfDomain(relativePath, domain);

  String? nameIn(FileDomain domain) => getMainDomainGroup(relativePath, domain);
}
