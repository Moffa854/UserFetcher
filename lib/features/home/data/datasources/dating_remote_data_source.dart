import 'package:dio/dio.dart';
import 'package:fetch_api_data/features/home/data/models/random_user_model.dart';

abstract class DatingRemoteDataSource {
  Future<RandomUserResponse> getRandomUsers();
}

class DatingRemoteDataSourceImpl implements DatingRemoteDataSource {
  final Dio dio;

  DatingRemoteDataSourceImpl({required this.dio});

  @override
  Future<RandomUserResponse> getRandomUsers() async {
    try {
      final response = await dio.get('https://randomuser.me/api/?page=1&results=10');
      
      if (response.statusCode == 200) {
        return RandomUserResponse.fromJson(response.data);
      } else {
        throw DioException(
          requestOptions: RequestOptions(path: ''),
          error: 'Failed to fetch random users',
        );
      }
    } catch (e) {
      throw DioException(
        requestOptions: RequestOptions(path: ''),
        error: e.toString(),
      );
    }
  }
}
