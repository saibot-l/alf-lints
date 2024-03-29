bool isEntryPointPath(
  final String? absolutePath, {
  required String packageName,
}) {
  if (absolutePath == null) return false;
  return RegExp('bin/(.*?).dart\$').hasMatch(absolutePath) ||
      RegExp('lib/(main|main_.*?|$packageName).dart\$')
          .hasMatch(absolutePath);
}
