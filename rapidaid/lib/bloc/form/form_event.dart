abstract class FormEvent {}

class FormSubmitted extends FormEvent {
  final bool isValid;
  final Map<String, String> errors;

  FormSubmitted({required this.isValid, this.errors = const {}});
}

class FormReset extends FormEvent {}
