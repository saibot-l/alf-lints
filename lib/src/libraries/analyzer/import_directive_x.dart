import 'package:analyzer/dart/ast/ast.dart';

import '../file_path/get_package_identifier.dart';
import '../file_path/get_package_name.dart';
import '../file_path/get_relative_package_path.dart';

extension ImportDirectiveX on ImportDirective {
  String? get fullPath => element?.importedLibrary?.source.fullName;

  String? get relativePath => isExternalPackageImport
      ? getPackageIdentifier(fullPath)
      : getRelativePackagePath(fullPath);

  bool get isExternalPackageImport {
    final sourcePackageName = getPackageName(
      element?.librarySource.uri.toString(),
    );
    final importPackageName = getPackageName(uri.stringValue);
    return importPackageName != null && importPackageName != sourcePackageName;
  }
}
