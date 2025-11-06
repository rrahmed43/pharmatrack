// home_bloc.dart
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/home/data/model/dynamic_data_model.dart';
import 'package:task/home/data/model/home_model.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  List<HomeModel> allCategories = [];

  HomeBloc() : super(HomeState.initial()) {
    on<LoadCategories>(_loadCategories);
    on<LoadDynamicData>(_loadDynamicData);
    on<SaveDynamicData>(_saveDynamicData);
  }

  Future<void> _loadCategories(
    LoadCategories event,
    Emitter<HomeState> emit,
  ) async {
    //loading state
    emit(
      state.copyWith(
        status: HomeStatus.loading,
        categoriesState: HomeStatus.loading,
      ),
    );
    //success state
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('categories')
          .get();
      allCategories = snapshot.docs
          .map((doc) => HomeModel.fromFirestore(doc))
          .toList();
      emit(
        state.copyWith(
          status: HomeStatus.success,
          categoriesState: HomeStatus.success,
          categories: allCategories,
        ),
      );
    }
    //error state
    catch (e) {
      emit(
        state.copyWith(
          status: HomeStatus.error,
          categoriesState: HomeStatus.error,
        ),
      );
    }
  }

  Future<void> _loadDynamicData(
    LoadDynamicData event,
    Emitter<HomeState> emit,
  ) async {
    //loading state
    emit(
      state.copyWith(
        status: HomeStatus.loading,
        dynamicDataState: HomeStatus.loading,
      ),
    );
    //success state
    try {
      final prefs = await SharedPreferences.getInstance();
      final jsonString = prefs.getString('saved_medicine_form_data');
      if (jsonString != null) {
        final decoded = jsonDecode(jsonString);
        final List<DynamicDataModel> dataList = [];
        if (decoded is Map<String, dynamic>) {
          decoded.forEach((key, value) {
            dataList.add(DynamicDataModel(type: key, value: value.toString()));
          });
        }
        emit(
          state.copyWith(
            status: HomeStatus.success,
            categoriesState: HomeStatus.success,
            dynamicData: dataList,
          ),
        );
      }
    }
    //error state
    catch (e) {
      emit(
        state.copyWith(
          status: HomeStatus.error,
          dynamicDataState: HomeStatus.error,
        ),
      );
    }
  }

  Future<void> _saveDynamicData(
    SaveDynamicData event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(
        status: HomeStatus.initial,
        dynamicDataState: HomeStatus.initial,
      ),
    );
    try {
      final prefs = await SharedPreferences.getInstance();
      final jsonString = jsonEncode(event.formData);
      await prefs.setString('saved_medicine_form_data', jsonString);
      final List<DynamicDataModel> dataList = event.formData.entries
          .map((e) => DynamicDataModel(type: e.key, value: e.value.toString()))
          .toList();
      emit(
        state.copyWith(
          status: HomeStatus.success,
          dynamicDataState: HomeStatus.success,
          dynamicData: dataList,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: HomeStatus.error,
          dynamicDataState: HomeStatus.error,
        ),
      );
    }
  }
}
