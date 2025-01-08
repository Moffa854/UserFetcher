import 'package:dio/dio.dart';
import 'package:fetch_api_data/features/home/data/datasources/dating_remote_data_source.dart';
import 'package:fetch_api_data/features/home/data/repositories/dating_repository_impl.dart';
import 'package:fetch_api_data/features/home/domain/usecases/get_random_users.dart';
import 'package:fetch_api_data/features/home/presentation/bloc/home_bloc.dart';
import 'package:fetch_api_data/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final dio = Dio();
    final dataSource = DatingRemoteDataSourceImpl(dio: dio);
    final repository = DatingRepositoryImpl(remoteDataSource: dataSource);
    final useCase = GetRandomUsers(repository);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fetch Data',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => HomeBloc(getRandomUsers: useCase),
        child: const HomePage(),
      ),
    );
  }
}
