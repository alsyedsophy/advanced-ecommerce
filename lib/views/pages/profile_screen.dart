import 'package:advanced_ecommerce/controllers/auth/auth_cubit.dart';
import 'package:advanced_ecommerce/views/widgets/main_buttom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MainButtom(
          title: "Logout",
          onPressed: () {
            context.read<AuthCubit>().logout();
          },
        ),
      ],
    );
  }
}
