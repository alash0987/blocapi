import 'package:bloc/bloc.dart';
import 'package:blocapi/get/bloc/user_get_event.dart';
import 'package:blocapi/get/bloc/user_get_state.dart';
import 'package:dio/dio.dart';

class UserGetBloc extends Bloc<UserGetEvent, UserGetState> {
  final Dio dio;
  UserGetBloc(this.dio) : super(UserGetInitialState()) {
    on<FetchUserGetEvent>((event, emit) async {
      emit(UserGetLoadingState());
      try {
        final response =
            await dio.get('https://jsonplaceholder.typicode.com/users');
        if (response.statusCode == 200) {
          emit(UserGetLoadedState(user: response.data));
        } else {
          emit(UserGetErrorState(error: 'Failed to fetch user'));
        }
      } catch (e) {
        emit(UserGetErrorState(error: e.toString()));
      }
    });
  }
}
