import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:task/home/presentation/view/widgets/portal_card.dart';
import 'package:task/home/presentation/view_model/home_bloc.dart';
import 'package:task/home/presentation/view_model/home_event.dart';
import 'package:task/home/presentation/view_model/home_state.dart';

class SavedMedicineDetailsPage extends StatelessWidget {
  const SavedMedicineDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {

    //load saved data when widget is built
    context.read<HomeBloc>().add(const LoadDynamicData());

  //BlocBuilder to re-build when state is changed
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.dynamicDataState == HomeStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.dynamicDataState == HomeStatus.error) {
          return const Center(child: Text('Failed to load saved data'));
        }
        if (state.dynamicData.isEmpty) {
          return const Center(child: Text("No saved data"));
        }
        return PortalCard(
          color: Colors.pink,
          isEmpty: false,
          cardChild: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: 150,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: state.dynamicData.map((item) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            item.type,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),
                          Text(item.value ?? '—'),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
