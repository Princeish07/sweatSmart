import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'common_loader_event.dart';
part 'common_loader_state.dart';

class CommonLoaderBloc extends Bloc<CommonLoaderEvent, CommonLoaderState> {
  CommonLoaderBloc() : super(CommonLoaderInitial()) {
    on<CommonLoaderEvent>((event, emit) {
      if(event is ShowLoaderEvent){
        emit(ShowLoaderState());
      }
      else if(event is HideLoaderEvent){
        emit(HideLoaderState());

      }

    });
  }

}
