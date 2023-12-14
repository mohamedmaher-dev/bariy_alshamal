import 'package:bariy_alshamal/core/themes/colors_manger.dart';
import 'package:bariy_alshamal/core/themes/text_styles.dart';
import 'package:bariy_alshamal/features/admin/orders/presntation/data/models/order_model.dart';
import 'package:bariy_alshamal/features/admin/orders/presntation/view_model/orders/orders_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class MoreBody extends StatelessWidget {
  const MoreBody({
    super.key,
    required this.orderDocID,
    required this.controller,
    required this.orderModel,
  });
  final OrderModel orderModel;

  final OrdersBloc controller;
  final String orderDocID;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.all(10.w),
      children: [
        ElevatedButton.icon(
          onPressed: () {
            double lat = orderModel.location.lat;
            double long = orderModel.location.long;
            Uri url = Uri.parse(
                "https://www.google.com/maps/dir/?api=1&origin=$lat,$long");
            launchUrl(url);
          },
          icon: const Icon(Icons.location_on),
          label: Text(
            "عرض الموقع",
            style: TextStyles.tsW12B,
          ),
          style: const ButtonStyle(
            foregroundColor: MaterialStatePropertyAll(ColorsManger.white),
            backgroundColor: MaterialStatePropertyAll(ColorsManger.green),
          ),
        ),
        SizedBox(height: 10.h),
        ElevatedButton.icon(
          onPressed: () {
            controller.add(
              ChangeOrderStatus(
                newStatus: 2,
                orderDocID: orderDocID,
                context: context,
              ),
            );
          },
          icon: const Icon(Icons.circle_outlined),
          label: Text(
            "جاري تنفيذ الطلب",
            style: TextStyles.tsW12B,
          ),
          style: const ButtonStyle(
            foregroundColor: MaterialStatePropertyAll(ColorsManger.white),
            backgroundColor: MaterialStatePropertyAll(ColorsManger.gold),
          ),
        ),
        SizedBox(height: 10.h),
        ElevatedButton.icon(
          onPressed: () {
            controller.add(
              ChangeOrderStatus(
                newStatus: 3,
                orderDocID: orderDocID,
                context: context,
              ),
            );
          },
          icon: const Icon(Icons.done_all_rounded),
          label: Text(
            "تم توصيل الطلب",
            style: TextStyles.tsW12B,
          ),
          style: const ButtonStyle(
            foregroundColor: MaterialStatePropertyAll(ColorsManger.white),
            backgroundColor: MaterialStatePropertyAll(ColorsManger.green),
          ),
        ),
        SizedBox(height: 10.h),
        ElevatedButton.icon(
          onPressed: () {
            controller.add(
              ChangeOrderStatus(
                newStatus: 0,
                orderDocID: orderDocID,
                context: context,
              ),
            );
          },
          icon: const Icon(Icons.close),
          label: Text(
            "تم رفض الطلب",
            style: TextStyles.tsW12B,
          ),
          style: const ButtonStyle(
            foregroundColor: MaterialStatePropertyAll(ColorsManger.white),
            backgroundColor: MaterialStatePropertyAll(Colors.grey),
          ),
        ),
        SizedBox(height: 10.h),
        ElevatedButton.icon(
          onPressed: () {
            controller.add(
              DeleteOrderEvent(
                orderID: orderDocID,
                context: context,
              ),
            );
          },
          icon: const Icon(Icons.delete),
          label: Text(
            "حذف",
            style: TextStyles.tsW12B,
          ),
          style: const ButtonStyle(
            foregroundColor: MaterialStatePropertyAll(ColorsManger.white),
            backgroundColor: MaterialStatePropertyAll(ColorsManger.red),
          ),
        ),
      ],
    );
  }
}
