import 'package:equatable/equatable.dart';
import 'package:fetch_api_data/features/home/domain/entities/dating_item.dart';


abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<DatingEntity> users;

  const HomeLoaded({required this.users});

  @override
  List<Object> get props => [users];
}

class HomeError extends HomeState {
  final String message;

  const HomeError({required this.message});

  @override
  List<Object> get props => [message];
}
