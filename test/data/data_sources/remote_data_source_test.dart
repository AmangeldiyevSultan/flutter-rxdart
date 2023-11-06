import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_rxdart/data/data_sources/remote_data_source.dart';
import 'package:flutter_rxdart/data/model/random_user_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late UserRemoteDataSource remoteDataSource;
  late Dio dio;

  setUp(() {
    dio = MockDio();
    remoteDataSource = UserRemoteDataSourceImpl(dio: dio);
  });

  const tUser = RandomUserModel.empty('error');

  group('Get User', () {
    test('should return [RandomUserModel] when no Exception is thrown',
        () async {
      when(() => dio.get(any())).thenAnswer((_) async => Response(
            requestOptions: RequestOptions(
              path: 'https://randomuser.me/api/',
            ),
            statusCode: 200,
            data: jsonEncode({
              "results": [
                tUser.toMap(),
              ],
            }),
          ));

      final result = await remoteDataSource.getUser();
      expect(result, equals(RandomUserModel.fromMap(tUser.toMap())));

      verify(
        () => dio.get('https://randomuser.me/api/'),
      ).called(1);
      verifyNoMoreInteractions(dio);
    });

    test('should throw [Exception]', () async {
      when(() => dio.get(any())).thenThrow((_) => Exception());

      final result = await remoteDataSource.getUser();

      expect(result, throwsA(Exception));

      verify(
        () => dio.get('https://randomuser.me/api/'),
      ).called(1);
      verifyNoMoreInteractions(dio);
    });
  });
}
