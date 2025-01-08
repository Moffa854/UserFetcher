import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fetch_api_data/core/error/failures.dart';
import 'package:fetch_api_data/features/home/data/datasources/dating_remote_data_source.dart';
import 'package:fetch_api_data/features/home/domain/entities/dating_item.dart';
import 'package:fetch_api_data/features/home/domain/repositories/dating_repository.dart';

class DatingRepositoryImpl implements DatingRepository {
  final DatingRemoteDataSource remoteDataSource;

  DatingRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<DatingEntity>>> getRandomUsers() async {
    try {
      final response = await remoteDataSource.getRandomUsers();
      final List<String> types = ['Dinner', 'Watch a Movie', 'Aquarium Date', 'Coffee', 'Park Walk'];
      final users = response.results.map((user) => DatingEntity(
            name: '${user.name.first} ${user.name.last}',
            age: user.dob.age,
            picture: user.picture.large,
            location: '${user.location.city}, ${user.location.country}',
            distance: '${(DateTime.now().microsecondsSinceEpoch % 10)} km from you',
            date: DateTime.now().add(Duration(days: DateTime.now().microsecondsSinceEpoch % 30)),
            type: types[DateTime.now().microsecondsSinceEpoch % types.length],
          )).toList();
      return Right(users);
    } on DioException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
