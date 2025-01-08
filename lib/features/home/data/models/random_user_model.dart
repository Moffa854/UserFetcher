import 'package:fetch_api_data/features/home/data/models/dob%20model/dob_model.dart';
import 'package:fetch_api_data/features/home/data/models/location%20model/location_model.dart';
import 'package:fetch_api_data/features/home/data/models/login%20model/login_model.dart';
import 'package:fetch_api_data/features/home/data/models/name%20model/name_model.dart';
import 'package:fetch_api_data/features/home/data/models/picture%20model/picture_model.dart';
import 'package:fetch_api_data/features/home/data/models/registered%20model/registered_model.dart';

class RandomUserResponse {
  final List<RandomUser> results;
  final RandomUserInfo info;

  RandomUserResponse({
    required this.results,
    required this.info,
  });

  factory RandomUserResponse.fromJson(Map<String, dynamic> json) {
    return RandomUserResponse(
      results: (json['results'] as List)
          .map((user) => RandomUser.fromJson(user))
          .toList(),
      info: RandomUserInfo.fromJson(json['info']),
    );
  }
}

class RandomUser {
  final String gender;
  final Name name;
  final Location location;
  final String email;
  final Login login;
  final Dob dob;
  final Registered registered;
  final String phone;
  final String cell;
  final PictureModel picture;
  final String nat;

  RandomUser({
    required this.gender,
    required this.name,
    required this.location,
    required this.email,
    required this.login,
    required this.dob,
    required this.registered,
    required this.phone,
    required this.cell,
    required this.picture,
    required this.nat,
  });

  factory RandomUser.fromJson(Map<String, dynamic> json) {
    return RandomUser(
      gender: json['gender'],
      name: Name.fromJson(json['name']),
      location: Location.fromJson(json['location']),
      email: json['email'],
      login: Login.fromJson(json['login']),
      dob: Dob.fromJson(json['dob']),
      registered: Registered.fromJson(json['registered']),
      phone: json['phone'],
      cell: json['cell'],
      picture: PictureModel.fromJson(json['picture']),
      nat: json['nat'],
    );
  }
}

class RandomUserInfo {
  final String seed;
  final int results;
  final int page;
  final String version;

  RandomUserInfo({
    required this.seed,
    required this.results,
    required this.page,
    required this.version,
  });

  factory RandomUserInfo.fromJson(Map<String, dynamic> json) {
    return RandomUserInfo(
      seed: json['seed'],
      results: json['results'],
      page: json['page'],
      version: json['version'],
    );
  }
}
