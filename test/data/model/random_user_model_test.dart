import 'dart:convert';

import 'package:flutter_rxdart/data/model/random_user_model.dart';
import 'package:flutter_rxdart/domain/entities/random_user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../fixture/fixture.dart';

class MockRandomUser extends Mock implements RandomUser {}

void main() {
  late RandomUserModel tRandomUserModel;
  setUp(() {
    tRandomUserModel = const RandomUserModel.empty('error');
  });

  test(
    'should return [LocalUser] type',
    () => {
      expect(tRandomUserModel, equals(isA<RandomUser>())),
    },
  );

  final tMap = jsonDecode(fixture('random_user.json')) as Map<String, dynamic>;

  group('from Map', () {
    test('should return a valid [RandomUserModel] from the map', () {
      final result = RandomUserModel.fromMap(tMap);

      expect(result, isA<RandomUserModel>());
      expect(result, equals(tRandomUserModel));
    });
  });

  test('should throw an [Error] when the map os invalid', () {
    final map = Map<String, dynamic>.from(tMap)..remove('name');

    const call = RandomUserModel.fromMap;

    expect(() => call(map), throwsA(isA<Error>()));
  });
}
