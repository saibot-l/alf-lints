bool isEntryPointPath(
  final String? absolutePath, {
  required String packageName,
}) =>
    absolutePath != null &&
    RegExp('(bin|lib)/(main|main_.*?|$packageName).dart\$')
        .hasMatch(absolutePath);
