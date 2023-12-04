import 'dart:async';

import 'package:bariy_alshamal/features/auth/otb/presntation/view_model/otp_bloc/otp_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/localization/generated/l10n.dart';
import '../../../../../../core/themes/text_styles.dart';

class OtpButtomBody extends StatefulWidget {
  const OtpButtomBody({super.key, required this.controller});
  final OtpBloc controller;

  @override
  State<OtpButtomBody> createState() => _OtpButtomBodyState();
}

class _OtpButtomBodyState extends State<OtpButtomBody> {
  @override
  void initState() {
    const oneSec = Duration(seconds: 1);
    Timer.periodic(
      oneSec,
      (Timer timer) {
        if (widget.controller.timeLeft <= 0) {
          timer.cancel();
        } else {
          setState(() {
            widget.controller.timeLeft--;
          });
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Language language = Language.of(context);
    return ListView(
      shrinkWrap: true,
      children: [
        Center(
          child: Text(
            "الوقت المتبقي هو",
            style: TextStyles.tsW15N,
          ),
        ),
        Center(
          child: Text(
            "${widget.controller.timeLeft}",
            style: TextStyles.tsW25B,
          ),
        ),
        SizedBox(height: 25.h),
        TextButton(
          onPressed: () {
            widget.controller.add(PhoneIncorrectClick(context: context));
          },
          child: Text(
            language.wrong_phone,
            style: TextStyles.tsR15N,
          ),
        ),
      ],
    );
  }
}
