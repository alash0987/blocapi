import 'package:bloc/bloc.dart';
import 'package:blocapi/post/bloc/user_post_event.dart';
import 'package:blocapi/post/bloc/user_post_state.dart';
import 'package:dio/dio.dart';

class UserPostBloc extends Bloc<PostEvent, UserPostState> {
  Dio dio = Dio();
  UserPostBloc(this.dio) : super(PostInitialState()) {
    on<PostFetchEvent>((event, emit) async {
      emit(PostLoadingState());
      try {
        final response =
            await dio.get('https://jsonplaceholder.typicode.com/posts');
        if (response.statusCode == 200) {
          emit(PostLoadedState(posts: response.data));
        } else {
          emit(PostErrorState(errorMessage: 'Failed to fetch posts'));
        }
      } catch (e) {
        emit(PostErrorState(errorMessage: e.toString()));
      }
    });
  }
}
