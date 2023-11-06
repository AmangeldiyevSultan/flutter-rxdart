import 'package:dartz/dartz.dart';
import 'package:flutter_rxdart/data/data_sources/remote_data_source.dart';
import 'package:flutter_rxdart/data/model/random_user_model.dart';
import 'package:flutter_rxdart/domain/repo/user_repo.dart';

class UserRepoImpl implements UserRepo {
  const UserRepoImpl(this._repo);

  final UserRemoteDataSource _repo;

  @override
  Future<Either<String, RandomUserModel>> getUser() async {
    try {
      final result = await _repo.getUser();
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
