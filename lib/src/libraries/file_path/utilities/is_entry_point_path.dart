bool isEntryPointPath(final String? fullPath, {required String packageName}) =>
    fullPath != null &&
    RegExp('(bin|lib)/(main|main_.*?|$packageName).dart\$').hasMatch(fullPath);
