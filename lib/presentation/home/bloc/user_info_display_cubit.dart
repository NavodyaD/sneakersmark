import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneakersmark/presentation/home/bloc/user_info_display_state.dart';

import '../../../domain/auth/usecases/get_user.dart';
import '../../../service_locator.dart';

class UserInfoDisplayCubit extends Cubit<UserInfoDisplayState> {

  // Initial state - Loading
  UserInfoDisplayCubit() : super(UserInfoLoading());

  void displayUserInfo() async {

    // fetch user info
    var returnedUserData = await sl<GetUserUseCase>().call();
    returnedUserData.fold(
      // Left emit
            (error){
          emit(
              LoadUserInfoFailure()
          );
        },
        // Right emit
            (data){
          emit(
              UserInfoLoaded(
                  user: data
              )
          );
        }
    );
  }
}