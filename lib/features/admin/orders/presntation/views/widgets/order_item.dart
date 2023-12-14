import 'package:bariy_alshamal/features/admin/orders/presntation/data/models/order_model.dart';
import 'package:bariy_alshamal/features/admin/orders/presntation/view_model/orders/orders_bloc.dart';
import 'package:bariy_alshamal/features/admin/orders/presntation/views/widgets/more_body.dart';
import 'package:bariy_alshamal/features/admin/orders/presntation/views/widgets/order_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jiffy/jiffy.dart';
import '../../../../../../core/themes/colors_manger.dart';
import '../../../../../../core/themes/text_styles.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({
    super.key,
    required this.orderModel,
    required this.controller,
  });
  final OrderModel orderModel;
  final OrdersBloc controller;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          showDragHandle: true,
          context: context,
          builder: (context) => OrderBody(orderModel: orderModel),
        );
      },
      child: Container(
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
                orderModel.orderID,
                style: TextStyles.tsW15B,
              ),
              subtitle: Text(
                "الرقم التعريفي للطلب",
                style: TextStyles.tsG10B,
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
                color: ColorsManger.white,
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
                      orderModel.productsCount.toString(),
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
                      orderModel.orderPrice.toString(),
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
                      orderModel.discount.toString(),
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
                Jiffy.parse(orderModel.date.toString()).yMMMMEEEEdjm,
                style: TextStyles.tsW15B,
              ),
              subtitle: Text(
                "تاريخ الطلب بتوقيت جرينتش",
                style: TextStyles.tsG10B,
              ),
            ),
            const Divider(),
            Padding(
              padding: EdgeInsets.all(10.w),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        showModalBottomSheet(
                          showDragHandle: true,
                          context: context,
                          builder: (context) => MoreBody(
                            orderModel: orderModel,
                            controller: controller,
                            orderDocID: orderModel.orderDocID,
                          ),
                        );
                      },
                      icon: const Icon(Icons.more_horiz_rounded),
                      label: const Text("المزيد"),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
