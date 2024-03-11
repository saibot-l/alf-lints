String? getPackageName(String? uri) {
  if (uri == null) return null;
  if (!uri.startsWith('package:')) return null;

  return uri.split('package:').last.split('/').first;
}
