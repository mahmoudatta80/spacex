import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/core/utils/app_regex.dart';
import 'package:spacex/core/widgets/custom_text_form_field.dart';
import 'package:spacex/features/edit_profile/logic/edit_profile_data_cubit.dart';
import 'package:spacex/features/edit_profile/ui/widgets/edit_profile_bloc_consumer.dart';
import 'custom_profile_image.dart';

class EditProfileScreenBody extends StatelessWidget {
  const EditProfileScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 24,
      ),
      child: SingleChildScrollView(
        child: Form(
          key: context.read<EditProfileDataCubit>().formKey,
          child: Column(
            children: [
              const CustomProfileImage(),
              SizedBox(
                height: MediaQuery.of(context).size.height / 18,
              ),
              CustomTextFormField(
                icon: Icons.person_outline_outlined,
                text: context.read<EditProfileDataCubit>().nameController.text,
                controller: context.read<EditProfileDataCubit>().nameController,
                validator: (value) {
                  if (value == null) {
                    return 'Name must not ber null';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.03,
              ),
              CustomTextFormField(
                controller: context.read<EditProfileDataCubit>().emailController,
                validator: (value) {
                  if (value == null || !AppRegex.isEmailValid(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
                text: context.read<EditProfileDataCubit>().emailController.text,
                icon: Icons.mail_outline_outlined,
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.05,
              ),
              const EditProfileBlocConsumer(),
            ],
          ),
        ),
      ),
    );
  }
}
