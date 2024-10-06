// lib/bloc_provider.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'get/bloc/user_get_bloc.dart';
import 'get/bloc/user_get_event.dart';
import 'post/bloc/user_post_bloc.dart';
import 'post/bloc/user_post_event.dart';

class AppBlocProvider extends StatelessWidget {
  final Widget child;

  const AppBlocProvider({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserGetBloc(Dio())..add(FetchUserGetEvent()),
        ),
        BlocProvider(
          create: (context) => UserPostBloc(Dio())..add(PostFetchEvent()),
        ),
      ],
      child: child,
    );
  }
}
