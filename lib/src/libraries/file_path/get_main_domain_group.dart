import 'file_domain.dart';
import 'get_domain_groups.dart';

String? getMainDomainGroup(String? relativePath, FileDomain domain) =>
    getDomainGroups(relativePath, FileDomain.features).firstOrNull;
