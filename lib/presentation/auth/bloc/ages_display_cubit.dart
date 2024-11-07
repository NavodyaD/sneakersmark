import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneakersmark/domain/auth/usecases/get_ages.dart';
import 'package:sneakersmark/presentation/auth/bloc/ages_display_states.dart';

import '../../../service_locator.dart';

class AgesDisplayCubit extends Cubit<AgesDisplayState> {

  // Initial State - Loading
  AgesDisplayCubit() : super(AgesLoading());

  void displayAges() async {

    var returnedData = await sl<GetAgesUseCase>().call();

    returnedData.fold(
            (message) {
              // Left Side - Failure State
          emit(
              AgesLoadFailure(message: message)
          );
        },
            (data) {
              // Right Side - Success State - Load ages with our data
          emit(
              AgesLoaded(ages: data)
          );
        }
    );

  }
}