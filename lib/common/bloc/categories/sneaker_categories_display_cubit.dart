import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneakersmark/common/bloc/categories/sneaker_categoris_display_state.dart';

import '../../../domain/category/usecase/get_categories.dart';
import '../../../service_locator.dart';

class CategoriesDisplayCubit extends Cubit<SneakerCategoriesDisplayState> {

  CategoriesDisplayCubit() : super (SneakerCategoriesLoading());

  void displayCategories() async {
    var returnedData = await sl<GetSneakerCategoriesUseCase>().call();
    returnedData.fold(
            (error){
          emit(
              SneakerCategoriesLoadFailure()
          );
        },
            (data) {
          emit(
              SneakerCategoriesLoaded(categories: data)
          );
        }
    );
  }

}