class SharedPStates{}

class InitialSharedPState extends SharedPStates{}

class LoggedInState extends SharedPStates{}
class SignedOutState extends SharedPStates{}

class SetIsLoggedInValueState extends SharedPStates{}
class SetIsLoggedInValueTrueState extends SharedPStates{}
class SetIsLoggedInValueFalseState extends SharedPStates{}

class SetIsFirstTimeValueFalseState extends SharedPStates{}

class SetUserDataInPrefs extends SharedPStates{}
class GetUserDataInPrefs extends SharedPStates{}

class FirstTimeState extends SharedPStates{}
class NotFirstTimeState extends SharedPStates{}