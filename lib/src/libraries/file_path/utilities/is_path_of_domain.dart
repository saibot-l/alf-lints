import '../file_domain.dart';

bool isPathOfDomain(String? relativePath, FileDomain domain) =>
    relativePath?.startsWith(domain.path) ?? false;
