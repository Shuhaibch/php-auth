import 'package:api_login/infrastructure/signin/signin_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignInRepository signInRepository;

  SignUpBloc(this.signInRepository) : super(SignUpInitial()) {
    on<SignUpRequired>((event, emit) async {
      emit(SignUpLoading());
      try {
        signInRepository.signInUser(event.email, event.password);
        emit(SignUpSuccess());
      } catch (e) {
        print(e);
        emit(SignUpFailed());
      }
    });
  }
}
