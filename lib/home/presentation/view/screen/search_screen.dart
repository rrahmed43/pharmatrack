import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/home/presentation/view_model/home_bloc.dart';
import 'package:task/home/presentation/view_model/home_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  Timer? _debounce;
  List<dynamic> filteredList = [];

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 2000), () {
      final categories = context.read<HomeBloc>().allCategories;
      filteredList = categories
          .where((cat) => cat.categoryName.toLowerCase().contains(query.toLowerCase()))
          .toList();
      setState(() {}); // Update UI
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("PharmaTrack"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            SearchBar(
              controller: _controller,
              hintText: 'Search',
              leading: const Icon(Icons.search),
            onChanged: _onSearchChanged,
            ),
           
            Expanded(
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is HomeLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is HomeError) {
                    return Center(child: Text(state.message));
                  } else if (state is HomeLoaded) {
                    final displayList =
                        _controller.text.isEmpty ? state.categories : filteredList;
              
                    if (displayList.isEmpty) {
                      return const Center(child: Text('No categories found'));
                    }
              
                    return ListView.separated(
                      itemCount: displayList.length,
                      separatorBuilder: (_, __) => const Divider(height: 1),
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(displayList[index].categoryName),
                        );
                      },
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
