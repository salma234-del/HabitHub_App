import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/Core/services/service_locator.dart';
import 'package:todo/Core/utils/app_text.dart';
import 'package:todo/Core/utils/global/theme/app_color/app_color.dart';
import 'package:todo/Core/utils/icons.dart';
import 'package:todo/Core/widgets/custom_text_form_field.dart';
import 'package:todo/Features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:todo/Features/profile/presentation/cubits/profile_cubit/profile_state.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(sl())..getUser(),
      child: Builder(builder: (context) {
        return BlocConsumer<ProfileCubit, ProfileState>(
          listener: (context, state) {
            if (state is UpdateProfileSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Profile updated successfully'),
                ),
              );
            } else if (state is UpdateProfileFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage),
                ),
              );
            }
          },
          builder: (context, state) {
            var cubit = BlocProvider.of<ProfileCubit>(context);
            if (state is ProfileLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProfileFailure) {
              return const Center(child: Text('Failed to load user data'));
            } else {
              return Scaffold(
                extendBodyBehindAppBar: true,
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
                body: Container(
                  color: AppColor.blueBg,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          const SizedBox(height: 50),
                          InkWell(
                            onTap: () async {
                              await cubit.imagePick();
                            },
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: cubit.imageUrl == ''
                                  ? cubit.imageUrl == ''
                                      ? const AssetImage(emptyProfile)
                                      : AssetImage(cubit.imageUrl)
                                  : NetworkImage(cubit.imageUrl),
                            ),
                          ),
                          const SizedBox(height: 20),
                          CustomTextFormField(
                            hintText: AppText.fullName,
                            controller: cubit.fullNameController,
                          ),
                          const SizedBox(height: 20),
                          CustomTextFormField(
                            hintText: AppText.email,
                            controller: cubit.emailController,
                            readOnly: true,
                          ),
                          const SizedBox(height: 40),
                          ElevatedButton(
                            onPressed: () {
                              cubit.updateUser();
                            },
                            child: const Text(AppText.save),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }
          },
        );
      }),
    );
  }
}
