import 'get_package_path.dart';

String? getPackageIdentifier(String? fullPath) => getPackagePath(fullPath)
    ?.split('/')
    .reversed
    .take(2)
    .toList()
    .reversed
    .join('/');
