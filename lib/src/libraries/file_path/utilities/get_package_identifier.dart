import 'get_package_path.dart';

String? getPackageIdentifier(String? absolutePath) =>
    getPackagePath(absolutePath)
        ?.split('/')
        .reversed
        .take(2)
        .toList()
        .reversed
        .join('/');
