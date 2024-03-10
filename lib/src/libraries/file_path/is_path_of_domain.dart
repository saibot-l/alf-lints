import 'package:alf_lints/src/libraries/file_path/file_domain.dart';

/// Returns `true` if the [relativePath] starts in a directory named like the [domain]'s path or false in case it's `null`.
bool isPathOfDomain(String? relativePath, FileDomain domain) =>
    relativePath?.startsWith(domain.path) ?? false;
