part of 'common_loader_bloc.dart';

abstract class CommonLoaderEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

 class ShowLoaderEvent extends CommonLoaderEvent {

}
class HideLoaderEvent extends CommonLoaderEvent {

}