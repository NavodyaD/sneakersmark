import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

abstract class CategoryFirebaseService {
  Future<Either> getSneakerCategories();
}

class CategoryFirebaseServiceImpl extends CategoryFirebaseService {
  @override
  Future<Either> getSneakerCategories() async {
    try {
      var sneakerCategories = await FirebaseFirestore.instance.collection('SneakerCategories').get();
      return Right(
        sneakerCategories.docs.map((e) => e.data()).toList()
      );
    } catch (e) {
      return const Left(
        'Unable to display categories'
      );
    }
  }


}