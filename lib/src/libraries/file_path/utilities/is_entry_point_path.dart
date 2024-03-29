bool isEntryPointPath(
  final String? absolutePath, {
  required String packageName,
}) {
  if (absolutePath == null) return false;
  return RegExp('$packageName/bin/(.*?).dart\$').hasMatch(absolutePath) ||
      RegExp('$packageName/lib/(main|main_.*?|$packageName).dart\$')
          .hasMatch(absolutePath);
}
