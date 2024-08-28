import 'package:crm_flutter/core/network/dio_client.dart';
import 'package:crm_flutter/data/models/groups/add_group_request.dart';
import 'package:crm_flutter/data/models/timetable/timetable_request.dart';
import 'package:crm_flutter/data/services/dio/admin_group_management_dio_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';

import 'admin_group_management_dio_service_test.mocks.dart';

@GenerateMocks([DioClient])
void main() {
  late AdminGroupManagementDioService adminGroupManagementDioService;
  late MockDioClient mockDioClient;

  setUp(() {
    mockDioClient = MockDioClient();
    adminGroupManagementDioService = AdminGroupManagementDioService();
  });

  group('AdminGroupManagementDioService Tests', () {
    const url = '/groups';
    final mockResponseData = {'data': 'mock_data'};

    test('getAllGroups returns AppResponse with data', () async {
      // Arrange
      when(mockDioClient.get(url: anyNamed('url')))
          .thenAnswer((_) async => Response(
                data: mockResponseData,
                statusCode: 200,
                requestOptions: RequestOptions(path: url),
              ));

      // Act
      final result = await adminGroupManagementDioService.getAllGroups();

      // Assert
      expect(result.isSuccess, true);
      expect(result.data, mockResponseData['data']);
      verify(mockDioClient.get(url: url)).called(1);
    });

    test('addNewGroup returns AppResponse with data', () async {
      // Arrange
      const addGroupRequest = AddGroupRequest(
        name: 'New Group',
        mainTeacherId: -1,
        assistantTeacherId: -1,
        subjectId: -1,
      );
      when(mockDioClient.post(
        url: anyNamed('url'),
        data: anyNamed('data'),
      )).thenAnswer((_) async => Response(
            data: mockResponseData,
            statusCode: 200,
            requestOptions: RequestOptions(path: url),
          ));

      // Act
      final result =
          await adminGroupManagementDioService.addNewGroup(addGroupRequest);

      // Assert
      expect(result.isSuccess, true);
      expect(result.data, mockResponseData);
      verify(mockDioClient.post(url: url, data: addGroupRequest.toMap()))
          .called(1);
    });

    test('editGroup returns AppResponse with data', () async {
      // Arrange
      const groupId = 1;
      const newName = 'Updated Group';
      const newMainTeacherId = 2;
      const newAssistantTeacherId = 3;
      const mockEditUrl = '/groups/$groupId';

      when(mockDioClient.put(
        url: mockEditUrl,
        data: anyNamed('data'),
      )).thenAnswer((_) async => Response(
            data: mockResponseData,
            statusCode: 200,
            requestOptions: RequestOptions(path: mockEditUrl),
          ));

      // Act
      final result = await adminGroupManagementDioService.editGroup(
        groupId: groupId,
        newName: newName,
        newMainTeacherId: newMainTeacherId,
        newAssistantTeacherId: newAssistantTeacherId,
      );

      // Assert
      expect(result.isSuccess, true);
      expect(result.data, mockResponseData);
      verify(mockDioClient.put(
        url: mockEditUrl,
        data: {
          "name": newName,
          "main_teacher_id": newMainTeacherId,
          "assistant_teacher_id": newAssistantTeacherId,
        },
      )).called(1);
    });

    test('deleteGroup returns AppResponse with data', () async {
      // Arrange
      const groupId = 1;
      const mockDeleteUrl = '/groups/$groupId';
      when(mockDioClient.delete(url: mockDeleteUrl)).thenAnswer((_) async =>
          Response(
              data: mockResponseData,
              statusCode: 200,
              requestOptions: RequestOptions(path: mockDeleteUrl)));

      // Act
      final result =
          await adminGroupManagementDioService.deleteGroup(groupId: groupId);

      // Assert
      expect(result.isSuccess, true);
      expect(result.data, mockResponseData);
      verify(mockDioClient.delete(url: mockDeleteUrl)).called(1);
    });

    test('updateGroupStudents returns AppResponse with data', () async {
      // Arrange
      const groupId = 1;
      final studentsId = [1, 2, 3];
      const mockUpdateUrl = '/groups/$groupId/students';

      when(mockDioClient.post(url: mockUpdateUrl, data: anyNamed('data')))
          .thenAnswer((_) async => Response(
                data: mockResponseData,
                statusCode: 200,
                requestOptions: RequestOptions(path: mockUpdateUrl),
              ));

      // Act
      final result = await adminGroupManagementDioService.updateGroupStudents(
          groupId: groupId, studentsId: studentsId);

      // Assert
      expect(result.isSuccess, true);
      expect(result.data, mockResponseData);
      verify(mockDioClient.post(
        url: mockUpdateUrl,
        data: {"students": studentsId},
      )).called(1);
    });

    test('createTimetableForGroup returns AppResponse with data', () async {
      // Arrange
      const timetableRequest = TimetableRequest(
        groupId: 1,
        startTime: "1234",
        endTime: "1234",
        roomId: -1,
        dayId: -1,
      );
      const mockTimetableUrl = '/group-classes';

      when(mockDioClient.post(url: mockTimetableUrl, data: anyNamed('data')))
          .thenAnswer((_) async => Response(
                data: mockResponseData,
                statusCode: 200,
                requestOptions: RequestOptions(path: mockTimetableUrl),
              ));

      // Act
      final result =
          await adminGroupManagementDioService.createTimetableForGroup(
        timetableRequest: timetableRequest,
      );

      // Assert
      expect(result.isSuccess, true);
      expect(result.data, mockResponseData);
      verify(mockDioClient.post(
        url: mockTimetableUrl,
        data: timetableRequest.toMap(),
      )).called(1);
    });
  });
}
