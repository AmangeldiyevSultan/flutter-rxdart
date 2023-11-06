import 'package:dartz/dartz.dart';
import 'package:flutter_rxdart/domain/entities/random_user.dart';
import 'package:flutter_rxdart/domain/repo/user_repo.dart';

class GetUser {
  const GetUser(this._repo);

  final UserRepo _repo;

  Future<Either<String, RandomUser>> call() => _repo.getUser();
}
