abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsBottomNavBarChangeState extends NewsStates {}

class NewsGetDataLoadingState extends NewsStates {}

class NewsGetDataSuccessState extends NewsStates {}

class NewsGetDataErrorState extends NewsStates {
  final String errorHappened;
  NewsGetDataErrorState(this.errorHappened);
}
