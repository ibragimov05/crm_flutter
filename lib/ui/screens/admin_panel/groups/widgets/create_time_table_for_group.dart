import 'package:crm_flutter/core/utils/utils.dart';
import 'package:crm_flutter/data/models/groups/group.dart';
import 'package:crm_flutter/data/models/timetable/timetable_request.dart';
import 'package:crm_flutter/logic/bloc/admin_group_management/admin_group_management_bloc.dart';
import 'package:crm_flutter/logic/bloc/admin_room_management/admin_room_management_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateTimeTableForGroup extends StatefulWidget {
  final Group group;

  const CreateTimeTableForGroup({super.key, required this.group});

  @override
  State<CreateTimeTableForGroup> createState() =>
      _CreateTimeTableForGroupState();
}

class _CreateTimeTableForGroupState extends State<CreateTimeTableForGroup> {
  final _formKey = GlobalKey<FormState>();

  int? _roomId;
  int? _dayId;
  TimeOfDay? _startTime;
  TimeOfDay? _endTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Timetable Entry'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            BlocBuilder<AdminRoomManagementBloc, AdminRoomManagementState>(
              buildWhen: (previous, current) =>
                  current is LoadedAdminGroupState,
              builder: (context, state) => state.maybeWhen(
                  loaded: (rooms) {
                    return rooms.isNotEmpty
                        ? DropdownButtonFormField<int>(
                            value: _roomId,
                            decoration:
                                const InputDecoration(labelText: 'Room'),
                            items: rooms
                                .map((room) => DropdownMenuItem(
                                      value: room.id,
                                      child: Text(room.name),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              _roomId = value;
                              setState(() {});
                            },
                            validator: (value) =>
                                value == null ? 'Please select a room' : null,
                          )
                        : const Center(child: Text('Create room first'));
                  },
                  orElse: () => const SizedBox()),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<int>(
              value: _dayId,
              decoration: const InputDecoration(labelText: 'Day'),
              items: const [
                DropdownMenuItem(value: 1, child: Text('Monday')),
                DropdownMenuItem(value: 2, child: Text('Tuesday')),
                DropdownMenuItem(value: 3, child: Text('Wednesday')),
                DropdownMenuItem(value: 4, child: Text('Thursday')),
                DropdownMenuItem(value: 5, child: Text('Friday')),
                DropdownMenuItem(value: 6, child: Text('Saturday')),
                DropdownMenuItem(value: 7, child: Text('Sunday')),
              ],
              onChanged: (value) {
                _dayId = value;
                setState(() {});
              },
              validator: (value) =>
                  value == null ? 'Please select a day' : null,
            ),
            const SizedBox(height: 16),
            ListTile(
              title: const Text('Start Time'),
              subtitle: Text(_startTime?.format(context) ?? 'Not set'),
              trailing: const Icon(Icons.access_time),
              onTap: () async {
                final time = await showTimePicker(
                  context: context,

                  initialTime: TimeOfDay.now(),
                );
                if (time != null) setState(() => _startTime = time);
              },
            ),
            const SizedBox(height: 16),
            ListTile(
              title: const Text('End Time'),
              subtitle: Text(_endTime?.format(context) ?? 'Not set'),
              trailing: const Icon(Icons.access_time),
              onTap: () async {
                final time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (time != null) setState(() => _endTime = time);
              },
            ),
            const SizedBox(height: 32),
            BlocListener<AdminGroupManagementBloc, AdminGroupManagementState>(
              listener: (context, state) {
                if (state is LoadedAdminGroupState) {
                  Navigator.of(context).pop();
                } else if (state is ErrorAdminGroupState) {
                  AppFunction.showToast(
                    message: state.errorMessage,
                    isSuccess: false,
                    context: context,
                  );
                }
              },
              child: ElevatedButton(
                child: const Text('Create Timetable Entry'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<AdminGroupManagementBloc>().add(
                          CreateTimetableForGroupEvent(
                            timetableRequest: TimetableRequest(
                              groupId: widget.group.id,
                              roomId: _roomId ?? 0,
                              dayId: _dayId ?? 0,
                              startTime: formatTime(_startTime),
                              endTime: formatTime(_endTime),
                            ),
                          ),
                        );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  String formatTime(TimeOfDay? timeOfDay) {
    timeOfDay ??= const TimeOfDay(hour: 0, minute: 0);
    return timeOfDay.toString().split('(')[1].split(')')[0];
  }
}