import 'package:bariy_alshamal/features/auth/otb/presntation/views/widgets/otp_body.dart';
import 'package:bariy_alshamal/features/auth/otb/presntation/views/widgets/otp_buttom_body.dart';
import 'package:bariy_alshamal/features/auth/otb/presntation/views/widgets/otp_msg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/themes/colors_manger.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManger.green,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(),
          const OtpMsg(),
          SizedBox(height: 50.h),
          const OtpBody(),
          const OtpButtomBody(),
          const Spacer(),
        ],
      ),
    );
  }
}
