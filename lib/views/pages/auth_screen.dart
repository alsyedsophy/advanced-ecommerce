import 'package:advanced_ecommerce/controllers/auth/auth_cubit.dart';
import 'package:advanced_ecommerce/controllers/auth/auth_state.dart';
import 'package:advanced_ecommerce/utilities/enum.dart';
import 'package:advanced_ecommerce/utilities/style/app_assets.dart';
import 'package:advanced_ecommerce/utilities/style/app_colors.dart';
import 'package:advanced_ecommerce/utilities/style/app_text_style.dart';
import 'package:advanced_ecommerce/views/widgets/custom_text_field.dart';
import 'package:advanced_ecommerce/views/widgets/main_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

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
  AuthFormType authFormType = AuthFormType.login;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          showDialog(
            context: context,
            builder: (context) =>
                AlertDialog(title: Text("Error"), content: Text(state.error)),
          );
        }
      },
      builder: (context, state) {
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
                    authFormType == AuthFormType.login ? "Login" : "Register",
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
                  ),
                  Gap(8.h),
                  CustomTextField(
                    hinitText: "Password",
                    obsecureText: true,
                    controller: _passwordController,
                    focusNode: _passwordFocusNode,
                    onEditingComplete: () =>
                        authFormType == AuthFormType.register
                        ? FocusScope.of(
                            context,
                          ).requestFocus(_confirmPasswordFocusNode)
                        : null,
                    textInputAction: authFormType == AuthFormType.register
                        ? TextInputAction.next
                        : null,
                  ),
                  Gap(8.h),
                  authFormType == AuthFormType.login
                      ? SizedBox.shrink()
                      : CustomTextField(
                          hinitText: "Confirm Password",
                          obsecureText: true,
                          controller: _confirmPasswordController,
                          focusNode: _confirmPasswordFocusNode,
                        ),
                  authFormType == AuthFormType.login
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
                    title: authFormType == AuthFormType.login
                        ? "Login"
                        : "Register",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        authFormType == AuthFormType.login
                            ? context.read<AuthCubit>().login(
                                _emailController.text.trim(),
                                _emailController.text.trim(),
                              )
                            : context.read<AuthCubit>().signup(
                                _emailController.text.trim(),
                                _emailController.text.trim(),
                              );
                      }
                    },
                  ),
                  Gap(20.h),
                  Center(
                    child: InkWell(
                      onTap: () {
                        if (authFormType == AuthFormType.login) {
                          authFormType = AuthFormType.register;
                        } else {
                          authFormType = AuthFormType.login;
                        }
                        setState(() {});
                        _formKey.currentState!.reset();
                      },
                      child: Text(
                        authFormType == AuthFormType.login
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
                      authFormType == AuthFormType.login
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
