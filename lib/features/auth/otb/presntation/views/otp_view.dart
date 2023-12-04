import 'package:bariy_alshamal/features/auth/otb/presntation/view_model/otp_bloc/otp_bloc.dart';
import 'package:bariy_alshamal/features/auth/otb/presntation/views/widgets/otp_body.dart';
import 'package:bariy_alshamal/features/auth/otb/presntation/views/widgets/otp_buttom_body.dart';
import 'package:bariy_alshamal/features/auth/otb/presntation/views/widgets/otp_msg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/themes/colors_manger.dart';

class OtpView extends StatefulWidget {
  const OtpView({super.key});

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  late OtpBloc controller;
  @override
  void initState() {
    controller = BlocProvider.of<OtpBloc>(context);
    controller.add(OtpInitEvent(context: context));
    super.initState();
  }

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
          OtpButtomBody(controller: controller),
          const Spacer(),
        ],
      ),
    );
  }
}
