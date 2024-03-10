/// Returns `true` if the [fullPath] points to an entry point.
/// An entry point is located either within the `bin` or `lib` folder.
/// It should be named either `main.dart`, `main_<flavor>.dart` or `<package-name>.dart`.
bool isEntryPointPath(final String fullPath, {required String packageName}) =>
    RegExp('(bin|lib)/(main|main_.*?|$packageName).dart\$').hasMatch(fullPath);
