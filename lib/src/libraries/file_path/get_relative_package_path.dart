String? getRelativePackagePath(String fullPath) => switch (fullPath) {
      String() when fullPath.contains('/lib/src/') =>
        fullPath.split('/lib/src/').last,
      String() when fullPath.contains('/lib/') => fullPath.split('/lib/').last,
      String() => null,
    };
