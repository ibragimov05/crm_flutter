import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

part 'admin_timetable_management_event.dart';
part 'admin_timetable_management_state.dart';

class AdminTimetableManagementBloc extends Bloc<AdminTimetableManagementEvent, AdminTimetableManagementState> {
  AdminTimetableManagementBloc() : super(AdminTimetableManagementInitial()) {
    on<AdminTimetableManagementEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
