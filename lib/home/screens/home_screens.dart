import 'package:blocapi/get/bloc/user_get_bloc.dart';
import 'package:blocapi/get/bloc/user_get_state.dart';
import 'package:blocapi/post/bloc/user_post_bloc.dart';
import 'package:blocapi/post/bloc/user_post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MultiBloc with Dio'),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<UserGetBloc, UserGetState>(
              builder: (context, state) {
                if (state is UserGetLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is UserGetLoadedState) {
                  return ListView.builder(
                    itemCount: state.user!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(state.user![index]['name']),
                        subtitle: Text(state.user![index]['email']),
                      );
                    },
                  );
                } else if (state is UserGetErrorState) {
                  return Center(child: Text(state.error));
                }
                return Container();
              },
            ),
          ),
          const Divider(),
          Expanded(
            child: BlocBuilder<UserPostBloc, UserPostState>(
              builder: (context, state) {
                if (state is PostLoadingState) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is PostLoadedState) {
                  return ListView.builder(
                    itemCount: state.posts.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(state.posts[index]['title']),
                        subtitle: Text(state.posts[index]['body']),
                      );
                    },
                  );
                } else if (state is PostErrorState) {
                  return Center(child: Text(state.errorMessage));
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
