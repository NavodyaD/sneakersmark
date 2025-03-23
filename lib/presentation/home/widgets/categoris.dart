import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/bloc/categories/sneaker_categories_display_cubit.dart';
import '../../../common/bloc/categories/sneaker_categoris_display_state.dart';
import '../../../domain/category/entity/category.dart';

class SneakerCategories extends StatelessWidget {
  const SneakerCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesDisplayCubit()..displayCategories(),
      child: BlocBuilder<CategoriesDisplayCubit,SneakerCategoriesDisplayState>(
        builder: (context, state) {
          // Loading
          if (state is SneakerCategoriesLoading) {
            return const CircularProgressIndicator();
          }
          // Loaded
          if (state is SneakerCategoriesLoaded) {
            return Column(
              children: [
                const SizedBox(height: 20, ),
                _sneakercategories(state.categories)
              ],
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget _sneakercategories(List<CategoryEntity> categories) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(
              horizontal: 16
          ),
          itemBuilder: (contetx,index) {
            return Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.grey[800]!,
                  width: 1,
                ),
              ),
              child: Text(
                categories[index].snCategorytitle,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(width: 15),
          itemCount: categories.length
      ),
    );
  }
}