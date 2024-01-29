abstract class HomeState {
  const HomeState();
}

class HomeInitial extends HomeState {
  List<Object> get props => [];
}

class HomeLoading extends HomeState {
  List<Object> get props => [];
}

class HomeDone extends HomeState {
  List<Object> get props => [];
}

class HomeError extends HomeState {
  final String errorMessage;

  HomeError(this.errorMessage);

  List<Object> get props => [];
}
