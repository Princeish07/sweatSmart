import 'package:get_it/get_it.dart';
import 'package:sweat_smart/data/local/shared_pref/shared_preference.dart';
import 'package:sweat_smart/data/repository/home_repository_impl.dart';
import 'package:sweat_smart/data/repository/login_repoistory_impl.dart';
import 'package:sweat_smart/data/repository/registration_repository_impl.dart';
import 'package:sweat_smart/ui/home/repository/home_repository.dart';
import 'package:sweat_smart/ui/login/repository/login_repository.dart';
import 'package:sweat_smart/ui/register/repository/registration_repository.dart';

final serviceLocator = GetIt.instance; // GetIt.I is also valid
void setUp(){

  serviceLocator.registerSingleton<HomeRepositoryImpl>(HomeRepositoryImpl());



  serviceLocator.registerLazySingleton<LoginRepository>(
          () => LoginRepositoryImpl());

  serviceLocator.registerLazySingleton<RegistrationRepository>(
          () => RegistrationRepositoryImpl());
}