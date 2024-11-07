import 'package:cloud_firestore/cloud_firestore.dart';

// There are 3 states. Ages Loading, Loaded Ages, Ages Load Failure

abstract class AgesDisplayState {}

class AgesLoading extends AgesDisplayState {}

class AgesLoaded extends AgesDisplayState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> ages;
  AgesLoaded({required this.ages});
}

class AgesLoadFailure extends AgesDisplayState {
  final String message;

  AgesLoadFailure({required this.message});
}