
import 'package:dartz/dartz.dart';
import 'package:sneakersmark/core/usecase/usecase.dart';
import 'package:sneakersmark/data/auth/models/user_signin_req.dart';
import 'package:sneakersmark/domain/auth/repository/auth.dart';
import 'package:sneakersmark/service_locator.dart';

class SigninUseCase implements UseCase<Either,UserSigninReq> {

  @override
  Future<Either> call({UserSigninReq ? params}) async {
    // sl: Service Locator
    return sl<AuthRepository>().signin(params!);
  }

}
