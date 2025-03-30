import 'package:bouselwawa/Features/login/logic/cubit/login_cubit.dart';
import 'package:bouselwawa/Features/login/logic/cubit/login_state.dart';
import 'package:bouselwawa/core/helpers/extentions.dart';
import 'package:bouselwawa/core/routing/routes.dart';
import 'package:bouselwawa/core/theming/colors.dart';
import 'package:bouselwawa/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            // Show loading indicator
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.primaryColorTeal,
                ),
              ),
            );
          },
          success: (loginResponse) {
            context.pop();
            context.pushNamed(Routes.home, arguments: loginResponse);
          },
          error: (error) {
            setupErrorState(context, error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void setupErrorState(BuildContext context, String error) {
    
    context.pop();
    // Show error message
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            icon: const Icon(
              Icons.error_outline,
              color: ColorsManager.red,
            ),
            content: Text(error, style: TextStyles.font13TealSemiBold),
            actions: [
              TextButton(
                onPressed: () {
                  context.pop();
                },
                child: const Text(
                  'Got it',
                  style:
                      TextStyle(color: ColorsManager.primaryColorTeal),
                ),
              ),
            ],
          );
        });
  }
}
