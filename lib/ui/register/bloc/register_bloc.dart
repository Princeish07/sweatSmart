import 'package:bloc/bloc.dart';
import 'package:sweat_smart/data/model/LoginUserModel.dart';
import 'package:sweat_smart/other/general_utils.dart';
import 'package:sweat_smart/ui/register/bloc/register_event.dart';
import 'package:sweat_smart/ui/register/bloc/register_state.dart';
import 'package:sweat_smart/ui/register/repository/registration_repository.dart';

import '../../../other/resource.dart';

class RegisterBloc extends Bloc<RegisterEvent,RegisterState>{

  Resource<LoginUserModel>? registrationResponse;
  RegistrationRepository? registrationRepository;

  RegisterBloc(this.registrationRepository):super(RegisterState()){
    on<RegisterButtonClickEvent>(_register);
  }

  void _register(RegisterButtonClickEvent event, Emitter<RegisterState> emitter) async {
    _validationCheck(event);
    if (registrationResponse?.status == Status.SUCCESS) {
      registrationResponse = Resource.loading();
      emitter(state.copyWith(registrationResponse: registrationResponse));
      registrationResponse = await registrationRepository?.registrationNow(
          email: event.email.toString(),
          userName: event.userName.toString(),
          phone: event.phone.toString(),
          password: event.password.toString(),
          confirmPassword: event.confirmPassword.toString());
      emitter(state.copyWith(registrationResponse: registrationResponse));
    } else {
      emitter(state.copyWith(registrationResponse: registrationResponse));
    }
  }

  void _validationCheck(RegisterButtonClickEvent event){
    if(event.userName.toString().isEmpty) {
      registrationResponse = Resource.failure(message: "Please enter user name");
    }
    else if(event.email.toString().isEmpty) {
      registrationResponse = Resource.failure(message: "Please enter email");
    }
    else if(!event.email.toString().isValidEmail()) {
      registrationResponse = Resource.failure(message: "Please enter valid email");

    }else if(event.phone.toString().isEmpty) {
      registrationResponse = Resource.failure(message: "Please enter phone");

    }
    else if(event.phone.toString().length!=10) {
      registrationResponse = Resource.failure(message: "Please enter valid phone number");

    }
    else if(event.password.toString().isEmpty) {
      registrationResponse = Resource.failure(message: "Please enter password");

    }
    else if(event.password.toString().length<=6) {
      registrationResponse = Resource.failure(message: "Password length should be greater than 6");

    }
    else if(event.confirmPassword.toString().isEmpty) {
      registrationResponse = Resource.failure(message: "Please enter confirm password");

    }
    else if(event.password!=event.confirmPassword) {
      registrationResponse = Resource.failure(message: "Password didn't matched");

    }else {
      registrationResponse = Resource.success();

    }

    }


}