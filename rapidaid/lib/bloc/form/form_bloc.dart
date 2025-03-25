import 'package:flutter_bloc/flutter_bloc.dart';
import 'form_event.dart';
import 'form_state.dart';

class FormBloc extends Bloc<FormEvent, FormValidationState> {
  FormBloc() : super(FormInitial()) {
    on<FormSubmitted>(_onFormSubmitted);
    on<FormReset>(_onFormReset);
  }

  void _onFormSubmitted(
    FormSubmitted event,
    Emitter<FormValidationState> emit,
  ) {
    emit(FormLoading());

    // Simulate processing
    Future.delayed(const Duration(seconds: 1), () {
      if (event.isValid) {
        emit(FormSuccess());
      } else {
        emit(FormFailure(errors: event.errors));
      }
    });
  }

  void _onFormReset(FormReset event, Emitter<FormValidationState> emit) {
    emit(FormInitial());
  }
}
