import 'package:dartz/dartz.dart';
import 'package:flutter_rxdart/domain/entities/random_user.dart';

abstract class UserRepo {
  const UserRepo();

  Future<Either<String, RandomUser>> getUsere();
}
