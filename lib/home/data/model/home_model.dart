import 'package:cloud_firestore/cloud_firestore.dart';

class HomeModel {
  final String categoryName;
 final String mainCategoryName;

  HomeModel({required this.mainCategoryName, required this.categoryName});

  factory HomeModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>? ?? {};
    return HomeModel(categoryName: data['name'] ?? doc.id , mainCategoryName:data['mainCategoryName']);
  }
 
}
