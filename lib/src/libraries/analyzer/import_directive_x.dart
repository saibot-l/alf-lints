import 'package:alf_lints/src/libraries/file_path/get_package_identifier.dart';
import 'package:alf_lints/src/libraries/file_path/get_package_name.dart';
import 'package:alf_lints/src/libraries/file_path/get_relative_package_path.dart';
import 'package:analyzer/dart/ast/ast.dart';

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
