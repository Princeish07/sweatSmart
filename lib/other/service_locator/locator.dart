import 'package:get_it/get_it.dart';
import 'package:sweat_smart/data/local/shared_pref/shared_preference.dart';
import 'package:sweat_smart/data/repository/FirestoreRepository.dart';
import 'package:sweat_smart/data/repository/home_repository_impl.dart';
import 'package:sweat_smart/data/repository/login_repoistory_impl.dart';
import 'package:sweat_smart/data/repository/registration_repository_impl.dart';
import 'package:sweat_smart/ui/common_loader/bloc/common_loader_bloc.dart';
import 'package:sweat_smart/ui/create_alarm/bloc/create_alarm_bloc.dart';
import 'package:sweat_smart/ui/create_workout_plan/bloc/create_workout_plan_bloc.dart';
import 'package:sweat_smart/ui/home/bloc/home_bloc.dart';
import 'package:sweat_smart/ui/home/repository/home_repository.dart';
import 'package:sweat_smart/ui/login/bloc/login_bloc.dart';
import 'package:sweat_smart/ui/login/repository/auth_repository.dart';
import 'package:sweat_smart/ui/register/bloc/register_bloc.dart';
import 'package:sweat_smart/ui/register/repository/registration_repository.dart';
import 'package:sweat_smart/ui/running_excercise/bloc/running_exercise_bloc.dart';
import 'package:sweat_smart/ui/splash/bloc/splash_bloc.dart';

final serviceLocator = GetIt.instance; // GetIt.I is also valid
void setUp() {
  registerRepository();
  registerBloc();
}

registerRepository() {
  serviceLocator.registerFactory<HomeRepository>(() => HomeRepositoryImpl());
  serviceLocator.registerLazySingleton<AuthRepository>(() => LoginRepositoryImpl());
  serviceLocator.registerLazySingleton<RegistrationRepository>(() => RegistrationRepositoryImpl());
  serviceLocator.registerLazySingleton<FirebaseRepository>(() => FirebaseRepository());

}

registerBloc() {
  serviceLocator.registerFactory<HomeBloc>(() => HomeBloc(serviceLocator()));
  serviceLocator.registerFactory<LoginBloc>(() => LoginBloc(serviceLocator()));
  serviceLocator.registerFactory<RegisterBloc>(() => RegisterBloc(serviceLocator()));
  serviceLocator.registerFactory<CreateAlarmBloc>(() => CreateAlarmBloc());
  serviceLocator.registerLazySingleton<CommonLoaderBloc>(() => CommonLoaderBloc());
  serviceLocator.registerFactory<SplashBloc>(() => SplashBloc());
  serviceLocator.registerFactory<CreateWorkoutPlanBloc>(() => CreateWorkoutPlanBloc());
  serviceLocator.registerFactory<RunningExerciseBloc>(() => RunningExerciseBloc());
}
