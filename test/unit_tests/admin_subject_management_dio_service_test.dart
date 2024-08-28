import 'package:crm_flutter/core/network/dio_client.dart';
import 'package:crm_flutter/data/services/dio/admin_subject_management_dio_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

// Mock classes
class MockDioClient extends Mock implements DioClient {}

@GenerateMocks([DioClient])
void main() {
  late AdminSubjectManagementDioService service;
  late MockDioClient mockDioClient;

  setUp(() {
    mockDioClient = MockDioClient();
    service = AdminSubjectManagementDioService();
    service = AdminSubjectManagementDioService();
  });

  group('AdminSubjectManagementDioService', () {
    final mockResponseData = {'data': 'mock data'};

    test('getAllSubjects returns successful response', () async {
      when(mockDioClient.get(url: '/subjects')).thenAnswer(
        (_) async => Response(
          data: mockResponseData,
          statusCode: 200,
          requestOptions: RequestOptions(),
        ),
      );

      final result = await service.getAllSubjects();

      expect(result.isSuccess, true);
      expect(result.data, mockResponseData['data']);
    });

    test('getAllSubjects returns failure on DioException', () async {
      when(mockDioClient.get(url: '/subjects')).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: '/subjects'),
          response: Response(
            statusCode: 400,
            requestOptions: RequestOptions(path: '/subjects'),
          ),
        ),
      );

      final result = await service.getAllSubjects();

      expect(result.isSuccess, false);
      expect(result.errorMessage, isNotNull);
    });
  });
}
