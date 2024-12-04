import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo/Core/utils/app_text.dart';
import 'package:todo/Core/utils/icons.dart';
import 'package:todo/Core/utils/text_styles.dart';
import 'package:todo/Core/widgets/or_divider.dart';
import 'package:todo/Core/widgets/social_login.dart';
import 'package:todo/Features/auth/presentation/screens/widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    AppText.loginTitle,
                    style: AppTextStyles.text18_700,
                  ),
                  SizedBox(height: 19),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Text(
                      AppText.loginSubtitle,
                      style: AppTextStyles.text14_300,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 32),
                  SocialLogin(),
                  SizedBox(height: 30),
                  ORDivider(),
                  SizedBox(height: 90),
                  LoginForm(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
