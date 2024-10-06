import 'package:equatable/equatable.dart';

abstract class UserPostState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PostInitialState extends UserPostState {}

class PostLoadingState extends UserPostState {}

class PostLoadedState extends UserPostState {
  final List<dynamic> posts;
  PostLoadedState({required this.posts});
  @override
  List<Object?> get props => [posts];
}

class PostErrorState extends UserPostState {
  final String errorMessage;
  PostErrorState({required this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}
