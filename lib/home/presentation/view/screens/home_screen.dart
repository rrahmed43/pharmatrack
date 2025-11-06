import 'package:flutter/material.dart';
import 'package:task/home/presentation/view/widgets/medicine_categories_row.dart';
import 'package:task/home/presentation/view/widgets/portal_row.dart';
import 'package:task/home/presentation/view/screens/search_screen.dart';
import 'package:task/home/presentation/view/widgets/shop_row.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("PharmaTrack"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchBar(
                hintText: "Search",
                leading: Icon(Icons.search),
                onTap: () {
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (_) => const SearchScreen()));
                },
              ),
              SizedBox(height: 10),
              PortalRow(),
              SizedBox(height: 10),
             
              ShopRow(),
              SizedBox(height: 10),
              MedicineCategoriesRow(),
            ],
          ),
        ),
      ),
    );
  }
}
