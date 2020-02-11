class Application {
  const Application({
    this.authLoaded,
    this.initialLoaded,
  });

  final bool initialLoaded;
  final bool authLoaded;

  factory Application.initial() {
    return Application(
      authLoaded: false,
      initialLoaded: false,
    );
  }

  Application copyWith({
    bool authLoaded,
    bool initialLoaded,
  }) {
    return Application(
      authLoaded: authLoaded ?? this.authLoaded,
      initialLoaded: initialLoaded ?? this.initialLoaded,
    );
  }
}
