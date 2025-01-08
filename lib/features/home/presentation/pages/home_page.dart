import 'package:fetch_api_data/features/home/presentation/bloc/home_bloc.dart';
import 'package:fetch_api_data/features/home/presentation/bloc/home_state.dart';
import 'package:fetch_api_data/features/home/presentation/widgets/body_section_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeInitial) {
              context.read<HomeBloc>().add(GetRandomUsersEvent());
              return const Center(child: CircularProgressIndicator());
            }

            if (state is HomeLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is HomeError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state.message),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        context.read<HomeBloc>().add(GetRandomUsersEvent());
                      },
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              );
            }

            if (state is HomeLoaded) {
              return RefreshIndicator(
                onRefresh: () async {
                  context.read<HomeBloc>().add(GetRandomUsersEvent());
                },
                child: const BodySection(),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
