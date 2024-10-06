import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class UserGetState extends Equatable {
  @override
  List<Object?> get props => [];
}

class UserGetInitialState extends UserGetState {}

class UserGetLoadingState extends UserGetState {}

class UserGetLoadedState extends UserGetState {
  final List<dynamic>? user;
  UserGetLoadedState({this.user});
  @override
  List<Object?> get props => [user];
}

class UserGetErrorState extends UserGetState {
  final String error;
  UserGetErrorState({required this.error});
  @override
  List<Object?> get props => [error];
}
