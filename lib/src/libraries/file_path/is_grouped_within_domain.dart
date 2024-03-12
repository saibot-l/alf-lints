import 'file_domain.dart';
import 'get_domain_groups.dart';

bool isGroupedWithinDomain(String? relativePath, FileDomain domain) =>
    getDomainGroups(relativePath, domain).length > 1;
