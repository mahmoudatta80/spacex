import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/core/constant/colors.dart';
import 'package:spacex/core/routing/extensions.dart';
import 'package:spacex/core/themes/text_styles.dart';
import 'package:spacex/features/edit_profile/logic/edit_profile_data_cubit.dart';
import 'package:spacex/features/edit_profile/ui/widgets/custom_edit_profile_loading.dart';
import 'package:spacex/features/home/logic/get_profile_data_cubit.dart';

import '../widgets/edit_profile_screen_body.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  void initState() {
    context.read<GetProfileDataCubit>().getProfileData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDarkBlue,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundDarkBlue,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_outlined,
          ),
          onPressed: () {
            context.pop();
          },
          color: Colors.white,
        ),
        title: const Text(
          "Edit Profile",
          style: MyTextStyles.font20WhiteW600,
        ),
      ),
      body: Column(
        children: [
          BlocConsumer<GetProfileDataCubit, GetProfileDataState>(
            listener: (BuildContext context, GetProfileDataState state) {
              if (state is GetProfileDataSuccess) {
                context.read<EditProfileDataCubit>().nameController.text =
                    state.userModel.name;
                context.read<EditProfileDataCubit>().emailController.text =
                    state.userModel.email;
                context.read<EditProfileDataCubit>().profileImageUrl =
                    state.userModel.image;
              }
            },
            builder: (context, state) {
              if (state is GetProfileDataSuccess) {
                return const EditProfileScreenBody();
              } else if (state is GetProfileDataFailure) {
                return Center(
                  child: Text(
                    state.errorMessage,
                    style: MyTextStyles.font18WhiteBold,
                  ),
                );
              } else {
                return const CustomEditProfileLoading();
              }
            },
          ),
        ],
      ),
    );
  }
}
