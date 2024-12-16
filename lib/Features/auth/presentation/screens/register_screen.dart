import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo/Core/services/service_locator.dart';
import 'package:todo/Core/utils/app_text.dart';
import 'package:todo/Core/utils/icons.dart';
import 'package:todo/Core/utils/text_styles.dart';
import 'package:todo/Features/auth/presentation/cubits/register_cubit/register_cubit.dart';
import 'package:todo/Features/auth/presentation/screens/widgets/register_form.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(sl()),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            SvgPicture.asset(loginBg),
            const SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 100),
                    Text(
                      AppText.registerTitle,
                      style: AppTextStyles.text18_700,
                    ),
                    SizedBox(height: 19),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Text(
                        AppText.registerSubtitle,
                        style: AppTextStyles.text14_300,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    // SizedBox(height: 32),
                    // SocialLogin(),
                    // SizedBox(height: 30),
                    // ORDivider(),
                    SizedBox(height: 70),
                    RegisterForm(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
