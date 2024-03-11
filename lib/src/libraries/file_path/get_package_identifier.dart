import 'package:alf_lints/src/libraries/file_path/get_package_path.dart';

String? getPackageIdentifier(String? fullPath) => getPackagePath(fullPath)
    ?.split('/')
    .reversed
    .take(2)
    .toList()
    .reversed
    .join('/');
