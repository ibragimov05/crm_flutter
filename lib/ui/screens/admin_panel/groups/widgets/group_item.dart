import 'package:crm_flutter/core/utils/app_text_styles.dart';
import 'package:crm_flutter/data/models/groups/group.dart';
import 'package:crm_flutter/ui/screens/admin_panel/groups/widgets/edit_group_students_dialog.dart';
import 'package:crm_flutter/ui/screens/admin_panel/groups/widgets/edit_group_dialog.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';

class GroupItem extends StatelessWidget {
  final Group group;

  const GroupItem({super.key, required this.group});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.grayishBlue.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Group name: ${group.name}"),
                  Text("Main teacher name: ${group.mainTeacher.name}"),
                  Text("Assistant teacher: ${group.assistantTeacher.name}"),
                ],
              ),
              Expanded(
                child: Text(
                  "Students count: ${group.students.length}",
                  textAlign: TextAlign.end,
                  overflow: TextOverflow.ellipsis,  // Ensure the text doesn't overflow
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),  // Add some space between rows for better readability
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// edit student button
              TextButton(
                onPressed: () => showDialog(
                  context: context,
                  builder: (context) => EditGroupStudentsDialog(group: group),
                ),
                child: Text(
                  'Edit student',
                  style: AppTextStyles.nunitoSansW600.copyWith(
                    color: AppColors.darkShadeGreen,
                  ),
                ),
              ),

              /// edit group button
              TextButton(
                onPressed: () => showDialog(
                  context: context,
                  builder: (context) => EditGroupDialog(
                    group: group,
                  ),
                ),
                child: Text(
                  'Edit group',
                  style: AppTextStyles.nunitoSansW600.copyWith(
                    color: AppColors.darkShadeGreen,
                  ),
                ),
              ),

              /// delete group
              TextButton(
                onPressed: () {},
                child: Text(
                  'Delete group',
                  style: AppTextStyles.nunitoSansW600.copyWith(
                    color: AppColors.darkShadeGreen,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
