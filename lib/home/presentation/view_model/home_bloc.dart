// home_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task/home/data/model/home_model.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  List<HomeModel> allCategories = [];

  HomeBloc() : super(HomeLoading()) {
    on<LoadCategories>((event, emit) async {
      emit(HomeLoading());
      try {
        final snapshot =
            await FirebaseFirestore.instance.collection('categories').get();
        allCategories =
            snapshot.docs.map((doc) => HomeModel.fromFirestore(doc)).toList();
        emit(HomeLoaded(allCategories));
      } catch (e) {
        emit(HomeError(e.toString()));
      }
    });

  }
}
