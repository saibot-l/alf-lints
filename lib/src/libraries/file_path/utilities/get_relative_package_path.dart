String? getRelativePackagePath(String? absolutePath) => switch (absolutePath) {
      String() when absolutePath.contains('/lib/src/') =>
        absolutePath.split('/lib/src/').last,
      String() when absolutePath.contains('/lib/') =>
        absolutePath.split('/lib/').last,
      _ => null,
    };
