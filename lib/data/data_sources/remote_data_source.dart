import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_rxdart/data/model/random_user_model.dart';
import 'package:flutter_rxdart/domain/entities/random_user.dart';

abstract class UserRemoteDataSource {
  const UserRemoteDataSource();

  Future<RandomUserModel> getUser();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  const UserRemoteDataSourceImpl({
    required Dio dio,
  }) : _dio = dio;

  final Dio _dio;

  @override
  Future<RandomUserModel> getUser() async {
    try {
      Response response = await _dio.get('https://randomuser.me/api/');

      final result = response.data['results'][0] as Map<String, dynamic>;

      final randomUser = RandomUserModel.fromMap(result);
      return randomUser;
    } catch (e) {
      rethrow;
    }
  }
}
