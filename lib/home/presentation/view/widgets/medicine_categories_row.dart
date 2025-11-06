import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/home/presentation/view_model/home_bloc.dart';
import 'package:task/home/presentation/view_model/home_state.dart';

class MedicineCategoriesRow extends StatelessWidget {
  const MedicineCategoriesRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Categories",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        SizedBox(height: 4),
        BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state.categoriesState == HomeStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state.categoriesState == HomeStatus.success) {
              final categories = state.categories;

              if (categories.isEmpty) {
                return const Center(child: Text('No categories found'));
              }
              return SizedBox(
                height: 150, // Height for the circles
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  itemCount: categories.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.purple[200],
                            shape: BoxShape.circle,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            categories[index].mainCategoryName
                                .substring(0, 1)
                                .toUpperCase(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          categories[index].mainCategoryName,
                          style: const TextStyle(fontSize: 13),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    );
                  },
                ),
              );
            } else {
              return const Text('Error loading data');
            }
          },
        ),
      ],
    );
  }
}
