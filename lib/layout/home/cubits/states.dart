abstract class LavieStates {}

class LavieInitialStates extends LavieStates {}

class LavieChangeBottomNavigatorStates extends LavieStates {}

class LavieLoadingHomeDataStates extends LavieStates {}

class LavieSuccessHomeDataStates extends LavieStates {}

class LavieErrorHomeDataStates extends LavieStates {
  final String error;

  LavieErrorHomeDataStates(this.error);
}

class LavieLoadingPlantsDataStates extends LavieStates {}

class LavieSuccessPlantsDataStates extends LavieStates {}

class LavieErrorPlantsDataStates extends LavieStates {
  final String error;

  LavieErrorPlantsDataStates(this.error);
}

class LavieLoadingSpeedsDataStates extends LavieStates {}

class LavieSuccessSpeedsDataStates extends LavieStates {}

class LavieErrorSpeedsDataStates extends LavieStates {
  final String error;

  LavieErrorSpeedsDataStates(this.error);
}

class LavieLoadingToolsDataStates extends LavieStates {}

class LavieSuccessToolsDataStates extends LavieStates {}

class LavieErrorToolsDataStates extends LavieStates {
  final String error;

  LavieErrorToolsDataStates(this.error);
}

class LoadingSearch extends LavieStates {}

class SearchSuccess extends LavieStates {}

class SearchError extends LavieStates {
  final String error;

  SearchError(this.error);
}

class LavieLoadingBlogsDataStates extends LavieStates {}

class LavieSuccessBlogsDataStates extends LavieStates {}

class LavieErrorBlogsDataStates extends LavieStates {
  final String error;

  LavieErrorBlogsDataStates(this.error);
}

class LavieLoadingBlogsSearchDataStates extends LavieStates {}

class LavieSuccessBlogsSearchDataStates extends LavieStates {}

class LavieErrorBlogsSearchDataStates extends LavieStates {
  final String error;

  LavieErrorBlogsSearchDataStates(this.error);
}

class LavieLoadingUserDataStates extends LavieStates {}

class LavieSuccessUserDataStates extends LavieStates {}

class LavieErrorUserDataStates extends LavieStates {
  final String error;

  LavieErrorUserDataStates(this.error);
}

class LavieLoadingProfileUpdateStates extends LavieStates {}

class LavieSuccessProfileUpdateStates extends LavieStates {}

class LavieErrorProfileUpdateStates extends LavieStates {
  final String error;

  LavieErrorProfileUpdateStates(this.error);
}

class LavieLoadingFormusStates extends LavieStates {}

class LavieSuccessFormusStates extends LavieStates {}

class LavieErrorFormusStates extends LavieStates {
  final String error;

  LavieErrorFormusStates(this.error);
}
