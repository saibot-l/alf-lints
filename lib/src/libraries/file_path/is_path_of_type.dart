/// Returns `true` if the [relativePath] starts in a directory named [type] or false in case it's `null`.
bool isPathOfType(String? relativePath, String type) =>
    relativePath?.startsWith('$type/') ?? false;
