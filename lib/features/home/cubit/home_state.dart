class HomeState {
  final int currentIndex;

  HomeState({required this.currentIndex});

  HomeState copyWith({
    int? currentIndex,
  }) {
    return HomeState(
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}