import 'package:equatable/equatable.dart';
import 'package:task/home/data/model/dynamic_data_model.dart';
import 'package:task/home/data/model/home_model.dart';

enum HomeStatus { initial, loading, success, error, homeError }
 class HomeState extends Equatable {
   factory HomeState.initial(){
    return const HomeState(
  status:HomeStatus.initial,
  categoriesState :HomeStatus.initial,
  dynamicDataState : HomeStatus.initial,
  dynamicData:[],
  categories:[]

    );
   }


  const HomeState(
 {   
  this.status=HomeStatus.initial,
    this.categoriesState=HomeStatus.initial,
    this.dynamicDataState=HomeStatus.initial,
    this.categories= const [],
    this.dynamicData = const []
    }
  );

  final HomeStatus status;
  final HomeStatus categoriesState;
  final HomeStatus dynamicDataState;
  final List <HomeModel> categories;
  final List <DynamicDataModel> dynamicData;

  HomeState copyWith({
    HomeStatus?status,
HomeStatus?categoriesState,
    HomeStatus?dynamicDataState,
List <HomeModel>? categories,
   List <DynamicDataModel>? dynamicData,
    
  }){
    return HomeState(
      status: status??this.status,
      categoriesState: categoriesState??this.categoriesState,
      dynamicDataState: dynamicDataState?? this.dynamicDataState,
      categories: categories??this.categories,
      dynamicData: dynamicData??this.dynamicData
    );

  }
  @override
  List<Object?> get props => [
    status,
    categoriesState,
    dynamicDataState,
    categories,
    dynamicData
  ];
}
