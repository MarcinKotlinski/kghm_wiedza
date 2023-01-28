import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const LoginState()) {
    on<LogoutRequested>(_requestLogout);
    on<LoginRequested>(_requestLogin);
  }

  final AuthenticationRepository _authenticationRepository;

  Future<void> _requestLogin(
      LoginRequested event,
      Emitter<LoginState> emit,
      ) async {
    await _authenticationRepository.logIn();
  }

  Future<void> _requestLogout(
      LogoutRequested event,
      Emitter<LoginState> emit,
      ) async {
    await _authenticationRepository.logOut();
  }
}
