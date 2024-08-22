import 'dart:io';

import 'package:crm_flutter/logic/cubit/edit_profile_form_cubit/edit_profile_form_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/utils.dart';
import '../../../../logic/bloc/user/user_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../widgets/show_user_photo_item.dart';

class UserImageWidget extends StatefulWidget {
  const UserImageWidget({super.key});

  @override
  State<UserImageWidget> createState() => _UserImageWidgetState();
}

class _UserImageWidgetState extends State<UserImageWidget> {
  XFile? _xFile;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      buildWhen: (previous, current) =>
          current.userStatus == UserStatus.loading,
      builder: (context, state) {
        return GestureDetector(
          onTap: () async {
            _xFile = await ImagePicker().pickImage(
              source: ImageSource.gallery,
              imageQuality: 10,
            );
            if (_xFile != null) {
              if (!context.mounted) return;
              context
                  .read<EditProfileFormCubit>()
                  .profilePhotoChanged(_xFile!.path);
            }
          },
          child: BlocBuilder<EditProfileFormCubit, EditProfileFormState>(
            buildWhen: (previous, current) => current.photoPath.isNotEmpty,
            builder: (context, editProfileState) {
              return CircleAvatar(
                radius: 30,
                backgroundColor: AppColors.softPastelBlue,
                child: ShowUserPhotoItem(
                  imageFileForEdit: _xFile != null ? File(_xFile!.path) : null,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
