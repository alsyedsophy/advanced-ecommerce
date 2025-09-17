import 'package:advanced_ecommerce/controllers/auth_controller.dart';
import 'package:advanced_ecommerce/utilities/enum.dart';
import 'package:advanced_ecommerce/utilities/routing/app_routs.dart';
import 'package:advanced_ecommerce/utilities/style/app_assets.dart';
import 'package:advanced_ecommerce/utilities/style/app_colors.dart';
import 'package:advanced_ecommerce/utilities/style/app_text_style.dart';
import 'package:advanced_ecommerce/views/widgets/custom_text_field.dart';
import 'package:advanced_ecommerce/views/widgets/main_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _confirmPasswordFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  Future<void> _supmit(AuthController model) async {
    try {
      await model.supmit();
      if (!mounted) return;
      context.pushReplacement(AppRouts.navBar);
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(title: Text("Error"), content: Text(e.toString())),
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthController>(
      builder: (context, model, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: const EdgeInsets.only(
              top: 150.0,
              bottom: 80,
              right: 16,
              left: 16,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.authFormType == AuthFormType.login
                        ? "Login"
                        : "Register",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Gap(73.h),
                  CustomTextField(
                    hinitText: "Email",
                    obsecureText: false,
                    controller: _emailController,
                    focusNode: _emailFocusNode,
                    onEditingComplete: () =>
                        FocusScope.of(context).requestFocus(_passwordFocusNode),
                    textInputAction: TextInputAction.next,
                    onChanged: model.updateEmail,
                  ),
                  Gap(8.h),
                  CustomTextField(
                    hinitText: "Password",
                    obsecureText: true,
                    controller: _passwordController,
                    focusNode: _passwordFocusNode,
                    onEditingComplete: () =>
                        model.authFormType == AuthFormType.register
                        ? FocusScope.of(
                            context,
                          ).requestFocus(_confirmPasswordFocusNode)
                        : null,
                    textInputAction: model.authFormType == AuthFormType.register
                        ? TextInputAction.next
                        : null,
                    onChanged: model.updatePassword,
                  ),
                  Gap(8.h),
                  model.authFormType == AuthFormType.login
                      ? SizedBox.shrink()
                      : CustomTextField(
                          hinitText: "Confirm Password",
                          obsecureText: true,
                          controller: _confirmPasswordController,
                          focusNode: _confirmPasswordFocusNode,
                        ),
                  model.authFormType == AuthFormType.login
                      ? Align(
                          alignment: Alignment.topRight,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "Forgot Password?",
                              style: AppTextStyle.text14w500style.copyWith(
                                color: AppColors.primaryBlackColor,
                              ),
                            ),
                          ),
                        )
                      : SizedBox.shrink(),
                  Gap(20.h),
                  MainButtom(
                    title: model.authFormType == AuthFormType.login
                        ? "Login"
                        : "Register",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _supmit(model);
                      }
                    },
                  ),
                  Gap(20.h),
                  Center(
                    child: InkWell(
                      onTap: () {
                        model.toggelFormType();
                        _formKey.currentState!.reset();
                      },
                      child: Text(
                        model.authFormType == AuthFormType.login
                            ? "Don't have an acount? Register"
                            : "Already have an acount? Login",
                        style: AppTextStyle.text14w500style.copyWith(
                          color: AppColors.primaryBlackColor,
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Center(
                    child: Text(
                      model.authFormType == AuthFormType.login
                          ? "Or sign up with social account"
                          : "Or login with social account",
                      style: AppTextStyle.text14w500style.copyWith(
                        color: AppColors.primaryBlackColor,
                      ),
                    ),
                  ),
                  Gap(12.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          AppAssets.facebook,
                          width: 92.w,
                          height: 64.h,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          AppAssets.google,
                          width: 92.w,
                          height: 64.h,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
