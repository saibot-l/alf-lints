enum FileDomain {
  app('app/'),
  features('features/'),
  libraries('libraries/');

  final String path;

  const FileDomain(this.path);
}
