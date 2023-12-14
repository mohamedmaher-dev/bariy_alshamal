import 'package:bariy_alshamal/core/themes/colors_manger.dart';
import 'package:bariy_alshamal/core/themes/text_styles.dart';
import 'package:bariy_alshamal/core/utils/app_route.dart';
import 'package:bariy_alshamal/features/cart/presntation/view_model/cart_bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BankBody extends StatelessWidget {
  const BankBody({super.key, required this.controller});

  final CartBloc controller;
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(10.w),
      shrinkWrap: true,
      children: [
        ListTile(
          title: Text(
            "معلومات التحويل البنكي",
            textAlign: TextAlign.center,
            style: TextStyles.tsP15B,
          ),
          subtitle: const Text(
              textAlign: TextAlign.center,
              "برجاء تحويل تكلفة الطلب الي الحساب المذكور و كتابة رقم حسابك و اسم الحساب و اسم البنك و اختيار صورة ايصال الدفع"),
        ),
        const Divider(),
        Row(
          children: [
            Expanded(
              child: ListTile(
                title: Text(
                  "123456789",
                  style: TextStyles.tsP15B,
                ),
                subtitle: const Text("رقم حساب بري الشمال"),
              ),
            ),
            Expanded(
              child: ListTile(
                title: Text(
                  "بنك القاهرة",
                  style: TextStyles.tsP15B,
                ),
                subtitle: const Text("اسم البنك"),
              ),
            ),
          ],
        ),
        // TextFormField(
        //   controller: controller.bankAccountNum,
        //   decoration: const InputDecoration(
        //     hintText: "رقم الحساب",
        //     filled: true,
        //     suffixIcon: Icon(
        //       Icons.numbers,
        //     ),
        //   ),
        // ),
        // SizedBox(height: 10.h),
        // TextFormField(
        //   controller: controller.bankAccountName,
        //   decoration: const InputDecoration(
        //     hintText: "اسم الحساب",
        //     filled: true,
        //     suffixIcon: Icon(
        //       Icons.person,
        //     ),
        //   ),
        // ),
        // SizedBox(height: 10.h),
        // TextFormField(
        //   controller: controller.bankName,
        //   decoration: const InputDecoration(
        //     hintText: "اسم البنك",
        //     filled: true,
        //     suffixIcon: Icon(
        //       Icons.location_city_rounded,
        //     ),
        //   ),
        // ),
        SizedBox(height: 10.h),
        ElevatedButton.icon(
          onPressed: () {
            controller.add(PickBankInvoive());
          },
          icon: const Icon(Icons.image),
          label: const Text("صورة ايصال الدفع"),
          style: ButtonStyle(
            elevation: const MaterialStatePropertyAll(0),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                side: const BorderSide(color: ColorsManger.green),
                borderRadius: BorderRadius.all(
                  Radius.circular(10.r),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 10.h),
        ElevatedButton(
          onPressed: () {
            AppRoute.pop(context: context);
            controller.add(ConfirmCart());
          },
          style: const ButtonStyle(
            foregroundColor: MaterialStatePropertyAll(ColorsManger.white),
            backgroundColor: MaterialStatePropertyAll(ColorsManger.green),
          ),
          child: const Text("تاكيد"),
        ),
        SizedBox(height: 10.h),
      ],
    );
  }
}
