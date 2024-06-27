part of 'splash_bloc.dart';



 class SplashState extends Equatable {
   Resource<bool>? isAuthenticated;
   SplashState({this.isAuthenticated});
  @override
  List<Object?> get props => [isAuthenticated];


   SplashState copyWith({Resource<bool>? isAuthenticated}){
     return SplashState(isAuthenticated: isAuthenticated ?? this.isAuthenticated);
   }

 }
