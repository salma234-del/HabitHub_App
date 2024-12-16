import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/Core/services/service_locator.dart';
import 'package:todo/Core/utils/app_router.dart';
import 'package:todo/Core/utils/app_text.dart';
import 'package:todo/Core/utils/global/theme/app_color/app_color.dart';
import 'package:todo/Features/profile/presentation/cubits/logout_cubit/logout_cubit.dart';
import 'package:todo/Features/profile/presentation/cubits/logout_cubit/logout_state.dart';
import 'package:todo/Features/profile/presentation/screens/widgets/profile_item.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogoutCubit(sl()),
      child: SafeArea(
        child: Container(
          color: AppColor.pinkBg,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
            child: Column(
              children: [
                ProfileItem(
                  title: AppText.account,
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.profile);
                  },
                ),
                const SizedBox(height: 16),
                BlocConsumer<LogoutCubit, LogoutState>(
                  listener: (context, state) {
                    if (state is LogoutFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.errorMessage),
                          backgroundColor: Colors.red,
                        ),
                      );
                    } else if (state is LogoutSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Logout success!'),
                          backgroundColor: Colors.green,
                        ),
                      );
                      GoRouter.of(context).go(AppRouter.landing);
                    }
                  },
                  builder: (context, state) {
                    return ProfileItem(
                      title: AppText.logout,
                      onTap: () {
                        BlocProvider.of<LogoutCubit>(context).logout();
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
