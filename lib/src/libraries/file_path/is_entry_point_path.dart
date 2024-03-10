bool isEntryPointPath(final String fullPath, {required String packageName}) =>
    RegExp('(bin|lib)/(main|main_.*?|$packageName).dart\$').hasMatch(fullPath);
