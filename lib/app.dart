import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/home/presentation/view/widgets/medicine_categories_row.dart';
import 'package:task/home/presentation/view/widgets/portal_row.dart';
import 'package:task/home/presentation/view/screen/search_screen.dart';
import 'package:task/home/presentation/view/widgets/shop_row.dart';
import 'package:task/home/presentation/view_model/home_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("PharmaTrack"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // CustomSearchBar(),
            SearchBar(
              hintText: "Search",
              leading: Icon(Icons.search),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider.value(
                      value: context
                          .read<HomeBloc>(), // reuse the existing bloc
                      child: const HomeScreen(),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 10),
            PortalRow(),
            SizedBox(height: 10),
            Text(
              "Shop",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 4),
            PromoRow(),
            SizedBox(height: 10),
             MedicineCategoriesRow(),
          ],
        ),
      ),
    );
  }
}
