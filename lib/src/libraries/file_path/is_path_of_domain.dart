import 'package:alf_lints/src/libraries/file_path/file_domain.dart';

bool isPathOfDomain(String? relativePath, FileDomain domain) =>
    relativePath?.startsWith(domain.path) ?? false;
