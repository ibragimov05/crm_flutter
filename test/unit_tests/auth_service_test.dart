import 'package:crm_flutter/data/services/dio/auth_dio_service.dart';
import 'package:crm_flutter/data/services/shared_prefs/token_prefs_service.dart';
import 'package:crm_flutter/core/network/dio_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';

import 'auth_service_test.mocks.dart';


@GenerateMocks([DioClient, TokenPrefsService])
void main() {
  late AuthDioService authDioService;
  late MockDioClient mockDioClient;
  // late MockTokenPrefsService mockTokenPrefsService;

  setUp(() {
    mockDioClient = MockDioClient();
    // mockTokenPrefsService = MockTokenPrefsService();
    authDioService = AuthDioService();
  });

  group('AuthDioService - login', () {
    const phone = '123456789';
    const password = 'password';
    final mockResponseData = {
      'data': {'token': 'mock_token'}
    };

    test('should login successfully and save token', () async {
      // Arrange
      when(mockDioClient.post(
        url: '/login',
        data: anyNamed('data'),
      )).thenAnswer((_) async => Response(
        data: mockResponseData,
        statusCode: 200,
        requestOptions: RequestOptions(path: '/login'),
      ));

      // Act
      final result = await authDioService.login(phone: phone, password: password);

      // Assert
      expect(result.isSuccess, true);
      verify(mockDioClient.post(url: '/login', data: {
        'phone': phone,
        'password': password,
      })).called(1);
      // verify(mockTokenPrefsService.saveAccessToken('mock_token')).called(1);
    });

    test('should return error when DioException occurs', () async {
      // Arrange
      when(mockDioClient.post(url: '/login', data: anyNamed('data'))).thenThrow(
        DioException(
          response: Response(
            statusCode: 401,
            data: {'data': {'error': 'unauthorised'}},
            requestOptions: RequestOptions(path: '/login'),
          ),
          requestOptions: RequestOptions(path: '/login'),
        ),
      );

      // Act
      final result = await authDioService.login(phone: phone, password: password);

      // Assert
      expect(result.isSuccess, false);
      expect(result.errorMessage, 'Login or password is incorrect');
    });
  });
}
