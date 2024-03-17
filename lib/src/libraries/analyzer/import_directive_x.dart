import 'package:analyzer/dart/ast/ast.dart';

import '../file_path/utilities/get_package_identifier.dart';
import '../file_path/utilities/get_package_name.dart';
import '../file_path/utilities/get_relative_package_path.dart';

extension ImportDirectiveX on ImportDirective {
  String? get absolutePath => element?.importedLibrary?.source.fullName;

  String? get relativePath => isExternalPackageImport
      ? getPackageIdentifier(absolutePath)
      : getRelativePackagePath(absolutePath);

  bool get isExternalPackageImport {
    final sourcePackageName = getPackageName(
      element?.librarySource.uri.toString(),
    );
    final importPackageName = getPackageName(uri.stringValue);
    return importPackageName != null && importPackageName != sourcePackageName;
  }
}
