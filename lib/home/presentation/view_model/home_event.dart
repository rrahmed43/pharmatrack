import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  List<Object?> get props => [];
}

class LoadCategories extends HomeEvent {}

class LoadDynamicData extends HomeEvent {
  const LoadDynamicData();
}

class SaveDynamicData extends HomeEvent {
  final Map<String, dynamic> formData;
  const SaveDynamicData(this.formData);
}
