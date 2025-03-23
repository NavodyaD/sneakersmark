import 'package:dartz/dartz.dart';

// contract class
abstract class  CategoryRepository {

  Future<Either> getSneakerCategories();
}