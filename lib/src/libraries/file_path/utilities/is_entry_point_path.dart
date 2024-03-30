bool isEntryPointPath(
  final String? absolutePath, {
  required String packageName,
}) {
  if (absolutePath == null) return false;

  final appNameVariants = [
    packageName,
    packageName.replaceAll("_", "-"),
    packageName.replaceAll("-", "_"),
  ].join("|");

  return RegExp('($appNameVariants)/(bin|lib)/[^/]*.dart\$')
      .hasMatch(absolutePath);
}
