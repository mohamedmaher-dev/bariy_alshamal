import 'package:bariy_alshamal/features/admin/orders/presntation/views/widgets/order_body.dart';
import 'package:bariy_alshamal/features/my_orders/presentation/view_model/my_orders_bloc/my_orders_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jiffy/jiffy.dart';
import '../../../../../core/themes/colors_manger.dart';
import '../../../../../core/themes/text_styles.dart';

class MyOrderItem extends StatelessWidget {
  const MyOrderItem({
    super.key,
    required this.productName,
    required this.price,
    required this.count,
    required this.status,
    required this.date,
    required this.discount,
    required this.controller,
    required this.index,
  });
  final int discount;
  final DateTime date;
  final String productName;
  final String count;
  final String price;
  final int status;
  final MyOrdersBloc controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: ColorsManger.green,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            leading: const Icon(
              Icons.numbers,
              color: ColorsManger.white,
            ),
            title: Text(
              productName,
              style: TextStyles.tsW15B,
            ),
            subtitle: Text(
              "الرقم التعريفي للطلب",
              style: TextStyles.tsG10B,
            ),
            trailing: IconButton(
              onPressed: () async {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Scaffold(
                      body: OrderBody(
                        orderModel: controller.adminOrderModel.list[index],
                      ),
                    );
                  },
                );
              },
              icon: const Icon(
                Icons.text_snippet,
                color: ColorsManger.white,
              ),
            ),
          ),
          const Divider(),
          Row(
            children: [
              Expanded(
                child: ListTile(
                  leading: const Icon(
                    Icons.grid_view_rounded,
                    color: ColorsManger.white,
                  ),
                  title: Text(
                    count,
                    style: TextStyles.tsW15B,
                  ),
                  subtitle: Text(
                    "المنتجات",
                    style: TextStyles.tsG10B,
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  leading: const Icon(
                    Icons.monetization_on,
                    color: ColorsManger.white,
                  ),
                  title: Text(
                    price,
                    style: TextStyles.tsW15B,
                  ),
                  subtitle: Text(
                    "تكلفة الطلب",
                    style: TextStyles.tsG10B,
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  leading: const Icon(
                    Icons.discount_rounded,
                    color: ColorsManger.white,
                  ),
                  title: Text(
                    discount.toString(),
                    style: TextStyles.tsW15B,
                  ),
                  subtitle: Text(
                    "الخصم",
                    style: TextStyles.tsG10B,
                  ),
                ),
              ),
            ],
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.calendar_month,
              color: ColorsManger.white,
            ),
            title: Text(
              Jiffy.parse(date.toString()).yMMMMEEEEdjm,
              style: TextStyles.tsW15B,
            ),
            subtitle: Text(
              "تاريخ الطلب بتوقيت جرينتش",
              style: TextStyles.tsG10B,
            ),
          ),
          const Divider(),
          Container(
            margin: EdgeInsets.all(10.w),
            padding: EdgeInsets.all(5.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(100.r),
              ),
              color: status == 1
                  ? Colors.blue
                  : status == 2
                      ? Colors.orange
                      : status == 3
                          ? Colors.green
                          : Colors.red,
            ),
            child: Align(
              child: Text(
                status == 1
                    ? "الطلب قيد المراجعة"
                    : status == 2
                        ? "جاري تنفيذ الطلب"
                        : status == 3
                            ? "تم توصيل الطلب"
                            : "تم رفض الطلب",
                style: TextStyles.tsW12B,
              ),
            ),
          )
        ],
      ),
    );
  }
}
