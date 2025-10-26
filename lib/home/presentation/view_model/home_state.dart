
import 'package:equatable/equatable.dart';
import 'package:task/home/data/model/home_model.dart';

abstract class HomeState extends Equatable {
  const HomeState();
  @override
  List<Object?> get props => [];
}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<HomeModel> categories;
  const HomeLoaded(this.categories);

  @override
  List<Object?> get props => [categories];
}


class HomeError extends HomeState {
  final String message;
  const HomeError(this.message);

  @override
  List<Object?> get props => [message];
}

