import 'package:dartz/dartz.dart';
import 'package:fetch_api_data/core/error/failures.dart';
import 'package:fetch_api_data/features/home/domain/entities/dating_item.dart';
import 'package:fetch_api_data/features/home/domain/repositories/dating_repository.dart';

class GetRandomUsers {
  final DatingRepository repository;

  GetRandomUsers(this.repository);

  Future<Either<Failure, List<DatingEntity>>> call() async {
    return await repository.getRandomUsers();
  }
}
