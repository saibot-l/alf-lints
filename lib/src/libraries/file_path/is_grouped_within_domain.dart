import 'package:alf_lints/src/libraries/file_path/file_domain.dart';
import 'package:alf_lints/src/libraries/file_path/get_domain_groups.dart';

/// Returns `true` if the content of domain is grouped within a directory.
bool isGroupedWithinDomain(String? relativePath, FileDomain domain) =>
    getDomainGroups(relativePath, domain).length > 1;
