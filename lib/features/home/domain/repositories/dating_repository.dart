import 'package:dartz/dartz.dart';
import 'package:fetch_api_data/core/error/failures.dart';
import 'package:fetch_api_data/features/home/domain/entities/dating_item.dart';

abstract class DatingRepository {
  Future<Either<Failure, List<DatingEntity>>> getRandomUsers();
}
