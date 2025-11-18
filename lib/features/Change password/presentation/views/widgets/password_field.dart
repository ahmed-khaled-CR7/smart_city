import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_city/features/Change%20password/presentation/manager/cubit/change_password_cubit.dart';
import 'package:smart_city/features/Change%20password/presentation/views/widgets/Password%20Strength%20Hint%20.dart';
import 'package:smart_city/features/Change%20password/presentation/views/widgets/single_pass_field.dart';

class PasswordFields extends StatefulWidget {
  const PasswordFields({super.key});

  @override
  State<PasswordFields> createState() => _PasswordFieldsState();
}

class _PasswordFieldsState extends State<PasswordFields> {
  bool _showCurrent = false;
  bool _showNew = false;
  bool _showConfirm = false;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ChangePasswordCubit>();

    return Column(
      children: [
        SinglePasswordField(
          controller: cubit.oldPassController,
          hint: 'Current Password',
          showPass: _showCurrent,
          onToggle: () => setState(() => _showCurrent = !_showCurrent),
        ),
        SizedBox(height: 18.h),
        SinglePasswordField(
          controller: cubit.newPassController,
          hint: 'New Password',
          showPass: _showNew,
          onToggle: () => setState(() => _showNew = !_showNew),
        ),
        const SizedBox(height: 8),
        const PasswordStrengthHint(),
        SizedBox(height: 18.h),
        SinglePasswordField(
          controller: cubit.confirmPassController,
          hint: 'Confirm New Password',
          showPass: _showConfirm,
          onToggle: () => setState(() => _showConfirm = !_showConfirm),
        ),
      ],
    );
  }
}
