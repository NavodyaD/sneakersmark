abstract class ButtonState {}

// 4 Button States
// Initial State, Loading State, Success State, Failure State

class ButtonInitialState extends ButtonState {}

class ButtonLoadingState extends ButtonState {}

class ButtonSuccessState extends ButtonState {}

class ButtonFailureState extends ButtonState {
  final String errorMessage;
  ButtonFailureState({required this.errorMessage});
}