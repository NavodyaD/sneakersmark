import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_creation_req.dart';

abstract class AuthFirebaseService {
  Future<Either> signup(UserCreationReq user);
  Future<Either> getAges();
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either> signup(UserCreationReq user) async {
    try {
      var data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );
      await FirebaseFirestore.instance.collection('Users').doc(
        data.user!.uid
      ).set(
        {
          'firstName' : user.firstName,
          'lastName' : user.lastName,
          'email' : user.email,
          'gender' : user.gender,
          'age' : user.age,
        }
      );

      return Right(
        'Signup was successful'
      );

    } on FirebaseAuthException catch(e) {
      String message = '';

      if(e.code == 'weak-password') {
        message = 'The password provided is too weak';
      } else if (e.code == 'email-already-in-use') {
        message = 'An account exists with this email';
      }

      return Left(message);
    }
  }

  @override
  Future<Either> getAges() async {
    try {
      var returnedData = await FirebaseFirestore.instance.collection('Ages').get();
      return Right(
          returnedData.docs
      );
    } catch (e) {
      return const Left(
          'Please try select your age again'
      );
    }
  }
  
}