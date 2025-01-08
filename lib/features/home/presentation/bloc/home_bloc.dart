import 'package:fetch_api_data/features/home/presentation/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fetch_api_data/features/home/domain/usecases/get_random_users.dart';

part 'home_event.dart';


class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetRandomUsers getRandomUsers;

  HomeBloc({required this.getRandomUsers}) : super(HomeInitial()) {
    on<GetRandomUsersEvent>((event, emit) async {
      emit(HomeLoading());
      
      final result = await getRandomUsers();
      
      result.fold(
        (failure) => emit(const HomeError(message: 'Failed to fetch users')),
        (users) => emit(HomeLoaded(users: users)),
      );
    });
  }
}
