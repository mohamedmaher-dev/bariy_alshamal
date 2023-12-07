import 'package:bariy_alshamal/core/themes/colors_manger.dart';
import 'package:bariy_alshamal/core/themes/text_styles.dart';
import 'package:bariy_alshamal/core/utils/app_route.dart';
import 'package:bariy_alshamal/core/utils/popup_loading_manger.dart';
import 'package:bariy_alshamal/features/admin/promo_code/data/models/promo_code_model.dart';
import 'package:bariy_alshamal/features/admin/promo_code/presentation/view_model/bloc/promo_code_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PromoCodeItem extends StatelessWidget {
  const PromoCodeItem(
      {super.key, required this.controller, required this.promoCodeModle});
  final PromoCodeBloc controller;
  final PromoCodeModel promoCodeModle;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.w),
      color: ColorsManger.green,
      child: ListTile(
        title: Text(
          promoCodeModle.code,
          style: TextStyles.tsW15B,
        ),
        subtitle: Text(
          promoCodeModle.isAvtive ? "لم يتم استخدامة" : "تم استخدامة",
          style:
              promoCodeModle.isAvtive ? TextStyles.tsG10B : TextStyles.tsR10B,
        ),
        trailing: IconButton(
          onPressed: () {
            showModalBottomSheet(
              showDragHandle: true,
              context: context,
              builder: (context) => ListView(
                padding: EdgeInsets.all(10.w),
                shrinkWrap: true,
                children: [
                  ElevatedButton.icon(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        ColorsManger.green,
                      ),
                      foregroundColor: MaterialStatePropertyAll(
                        ColorsManger.white,
                      ),
                    ),
                    onPressed: () async {
                      AppRoute.pop(context: context);
                      await Clipboard.setData(
                        ClipboardData(
                          text: promoCodeModle.code,
                        ),
                      );
                      PopUpLoading.success("تم نسخ الكود");
                    },
                    icon: const Icon(Icons.copy),
                    label: const Text("نسخ"),
                  ),
                  ElevatedButton.icon(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        ColorsManger.red,
                      ),
                      foregroundColor: MaterialStatePropertyAll(
                        ColorsManger.white,
                      ),
                    ),
                    onPressed: () {
                      AppRoute.pop(context: context);
                      controller.add(
                        DeletePromoCode(code: promoCodeModle.code),
                      );
                    },
                    icon: const Icon(Icons.delete),
                    label: const Text("حذف"),
                  )
                ],
              ),
            );
          },
          icon: const Icon(
            Icons.more_vert_rounded,
            color: ColorsManger.white,
          ),
        ),
      ),
    );
  }
}
