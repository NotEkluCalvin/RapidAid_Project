class FormValidationState {}

class FormInitial extends FormValidationState {}

class FormLoading extends FormValidationState {}

class FormSuccess extends FormValidationState {}

class FormFailure extends FormValidationState {
  final Map<String, String> errors;

  FormFailure({required this.errors});
}
