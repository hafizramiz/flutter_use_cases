
import 'package:dio/dio.dart';

class UserRepository {
  UserRepository(this.api);

  final Api api;
  final Map<int, User?> _userCache = {};

  Future<User? > loadUser(int id) async {
    if (!_userCache.containsKey(id)) {
      final response = await api.get(id);
      if (response.statusCode == 200) { 
        _userCache[id] = User.fromJson(response.body);
      } else {
        _userCache[id] = null;
      }
    }
    return _userCache[id]; 
  }
}




extension on Response<dynamic> {
  dynamic get body => data;
}

class Api {
  Future<Response<dynamic>> get(int id) async {
    final sampleData = {'id': id, 'name': 'User $id'};
    return Response<dynamic>(
      requestOptions: RequestOptions(path: '/users/$id'),
      statusCode: 200,
      data: sampleData,
    );
  }
}

class User {
  final int id;
  final String name;
  User({required this.id, required this.name});
  static User? fromJson(dynamic body) {
    if (body == null) return null;
    return User(id: body['id'] as int, name: body['name'] as String);
  }
}

