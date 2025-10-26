import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/app.dart';
import 'package:task/home/presentation/view_model/home_bloc.dart';
import 'package:task/home/presentation/view_model/home_event.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
   runApp(
    BlocProvider(
      create: (_) => HomeBloc()..add(LoadCategories()),
      child:  MaterialApp(home: App()),
    ),
  );

}
