import 'package:dartz/dartz.dart';
import 'package:sneakersmark/core/usecase/usecase.dart';
import 'package:sneakersmark/domain/auth/repository/auth.dart';
import 'package:sneakersmark/service_locator.dart';

class SendPasswordResetEmailUseCase implements UseCase<Either,String> {

  @override
  Future<Either> call({String ? params}) async {
    return sl<AuthRepository>().sendPasswordResetEmail(params!);
  }

}