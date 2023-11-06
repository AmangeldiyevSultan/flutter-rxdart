import 'package:dio/dio.dart';
import 'package:flutter_rxdart/data/data_sources/remote_data_source.dart';
import 'package:flutter_rxdart/data/repos/user_repo_impl.dart';
import 'package:flutter_rxdart/domain/entities/random_user.dart';
import 'package:flutter_rxdart/domain/repo/user_repo.dart';
import 'package:flutter_rxdart/domain/use_case/get_user.dart';
import 'package:flutter_rxdart/presentation/bloc/get_user_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:rxdart/subjects.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await _initUser();
}

Future<void> _initUser() async {
  sl
    ..registerFactory(() => GetUserBloc(getUser: sl(), subject: sl()))
    ..registerLazySingleton(() => GetUser(sl()))
    ..registerLazySingleton<UserRepo>(() => UserRepoImpl(sl()))
    ..registerLazySingleton<UserRemoteDataSource>(
        () => UserRemoteDataSourceImpl(dio: sl()))
    ..registerLazySingleton(Dio.new)
    ..registerLazySingleton<BehaviorSubject<RandomUser>>(
        () => BehaviorSubject<RandomUser>());
}
