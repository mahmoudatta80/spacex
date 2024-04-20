import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/core/functions/show_toast.dart';
import 'package:spacex/core/widgets/custom_text_button.dart';
import 'package:spacex/features/register/logic/register_cubit.dart';

class RegisterBlocConsumer extends StatelessWidget {
  const RegisterBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    bool requestLoading = false;
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          requestLoading = true;
        } else if (state is RegisterSuccess) {
          showToast(text: 'Register done successfully');
          requestLoading = false;
        } else if (state is RegisterFailure) {
          showToast(text: state.errorMessage);
          requestLoading = false;
        }
      },
      builder: (context, state) {
        return CustomTextButton(
          text: 'Register',
          requestLoading: requestLoading,
          onPressed: () {
            if (context
                .read<RegisterCubit>()
                .formKey
                .currentState!
                .validate()) {
              context.read<RegisterCubit>().register();
            }
          },
        );
      },
    );
  }
}
