import 'package:dartz/dartz.dart';
import 'package:flutter_rxdart/domain/entities/random_user.dart';
import 'package:flutter_rxdart/domain/repo/user_repo.dart';
import 'package:flutter_rxdart/domain/use_case/get_user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockUserRepo extends Mock implements UserRepo {}

void main() {
  late MockUserRepo repo;
  late GetUser usecase;

  setUp(() {
    repo = MockUserRepo();
    usecase = GetUser(repo);
  });

  const tUser = RandomUser.empty('error');

  test('should return [RandomUser] from the [GetUser]', () async {
    when(() => repo.getUser()).thenAnswer((_) async => const Right(tUser));

    final result = await usecase();

    expect(result, equals(const Right<String, RandomUser>(tUser)));
  });
}
