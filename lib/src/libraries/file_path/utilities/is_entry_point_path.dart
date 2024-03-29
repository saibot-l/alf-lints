bool isEntryPointPath(
  final String? absolutePath, {
  required String packageName,
}) =>
    absolutePath != null &&
    RegExp('$packageName/(bin|lib)/[^/]*.dart\$').hasMatch(absolutePath);
