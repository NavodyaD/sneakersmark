import 'package:dartz/dartz.dart';
import 'package:sneakersmark/core/usecase/usecase.dart';
import 'package:sneakersmark/data/auth/models/user_creation_req.dart';
import 'package:sneakersmark/domain/auth/repository/auth.dart';
import 'package:sneakersmark/service_locator.dart';

class SignupUseCase implements UseCase<Either,UserCreationReq> {
  @override
  Future<Either> call({UserCreationReq ? params}) async {
    return await sl<AuthRepository>().signup(params!);
  }
  
}