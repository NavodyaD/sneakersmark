import 'package:dartz/dartz.dart';
import 'package:sneakersmark/data/category/models/category.dart';
import 'package:sneakersmark/data/category/source/category_firebase_service.dart';
import 'package:sneakersmark/domain/category/repository/category.dart';

import '../../../service_locator.dart';

// extends with contract class - in domain layer
class CategoryRepositoryImpl extends CategoryRepository {
  @override
  Future<Either> getSneakerCategories() async {
    var sneakerCategories = await sl<CategoryFirebaseService>().getSneakerCategories();
    return sneakerCategories.fold(
      // Left side
        (error) {
          return Left(error);
        },
        // Right side
        (data) {
          return Right(
            CategoryModel.fromMap(data)
          );
        }
    );
  }

}