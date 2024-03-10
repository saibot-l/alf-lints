/// Returns relative lib path after `lib/src/` or `lib/` from the given [fullPath] or null if the path is not a valid lib path.
///
/// Example:
/// - `import package:example/features/example_feature.dart`
///   - [fullPath] `packages/libraries/example_lib/lib/src/features/example_feature.dart`
///   - Returns `features/example_feature.dart`
String? getRelativePackagePath(String fullPath) => switch (fullPath) {
      String() when fullPath.contains('/lib/src/') =>
        fullPath.split('/lib/src/').last,
      String() when fullPath.contains('/lib/') => fullPath.split('/lib/').last,
      String() => null,
    };
