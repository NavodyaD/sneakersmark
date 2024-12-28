
import 'package:dartz/dartz.dart';
import 'package:sneakersmark/core/usecase/usecase.dart';
import 'package:sneakersmark/domain/auth/repository/auth.dart';
import 'package:sneakersmark/service_locator.dart';

class IsLoggedInUseCase implements UseCase<bool,dynamic> {
  @override
  Future<bool> call({params}) async {
    return await sl<AuthRepository>().isLoggedIn();
  }

}
