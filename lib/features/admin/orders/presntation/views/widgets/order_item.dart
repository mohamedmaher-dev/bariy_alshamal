import 'package:bariy_alshamal/core/utils/app_route.dart';
import 'package:bariy_alshamal/features/admin/orders/presntation/data/models/order_model.dart';
import 'package:bariy_alshamal/features/admin/orders/presntation/view_model/orders/orders_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';

import '../../../../../../core/themes/colors_manger.dart';
import 'field_item.dart';

class OrderItem extends StatelessWidget {
  const OrderItem(
      {super.key, required this.orderModel, required this.controller});
  final OrderModel orderModel;
  final OrdersBloc controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsManger.green,
        borderRadius: BorderRadius.all(
          Radius.circular(10.r),
        ),
      ),
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Row(
            children: [
              FieldItem(title: "اسم المنتج", value: orderModel.productName),
              FieldItem(
                title: "تكلفة المنتج",
                value: orderModel.price.toString(),
              ),
            ],
          ),
          Row(
            children: [
              FieldItem(
                title: "الكمية",
                value: orderModel.count.toString(),
              ),
              FieldItem(
                title: "تاريخ الطلب",
                value:
                    "${orderModel.date.year}/${orderModel.date.month}/${orderModel.date.day}",
              ),
            ],
          ),
          const Divider(),
          Row(
            children: [
              FieldItem(title: "الحجم", value: orderModel.size ?? "-"),
              FieldItem(title: "الرأس", value: orderModel.head ?? "-"),
            ],
          ),
          Row(
            children: [
              FieldItem(
                  title: "طريقة التغليف", value: orderModel.package ?? "-"),
              FieldItem(title: "مفروم", value: orderModel.mafroum ?? "-"),
            ],
          ),
          Row(
            children: [
              FieldItem(title: "طريقة التقطيع", value: orderModel.cut ?? "-"),
            ],
          ),
          Row(
            children: [
              FieldItem(title: "ملاحظة", value: orderModel.note ?? "-"),
            ],
          ),
          const Divider(),
          Row(
            children: [
              FieldItem(title: "اسم العميل", value: orderModel.userName),
              FieldItem(
                title: "رقم العميل",
                value:
                    "0${orderModel.userPhone.toString().replaceRange(0, 4, "")}",
              ),
            ],
          ),
          const Divider(),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(10.w),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (contextDialog) {
                          return FlutterMap(
                            options: MapOptions(
                              initialCenter: LatLng(orderModel.location.lat,
                                  orderModel.location.long),
                              initialZoom: 9.2,
                            ),
                            children: [
                              TileLayer(
                                urlTemplate:
                                    'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                userAgentPackageName: 'com.example.app',
                              ),
                              MarkerLayer(
                                markers: [
                                  Marker(
                                    point: LatLng(orderModel.location.lat,
                                        orderModel.location.long),
                                    width: 80,
                                    height: 80,
                                    child: const Icon(
                                      Icons.location_pin,
                                      color: ColorsManger.green,
                                      size: 50,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      );
                    },
                    icon: const Icon(
                      Icons.location_pin,
                    ),
                    label: const Text("عرض الموقع"),
                    style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(ColorsManger.gold),
                      foregroundColor:
                          MaterialStatePropertyAll(ColorsManger.white),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(10.w),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (contextDialog) => AlertDialog(
                          title: const Text("حذف الطلب"),
                          content: const Text("هل تريد حقا حذف الطلب"),
                          actions: [
                            ElevatedButton(
                              style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(ColorsManger.red),
                                foregroundColor: MaterialStatePropertyAll(
                                  ColorsManger.white,
                                ),
                              ),
                              onPressed: () {
                                AppRoute.pop(context: contextDialog);
                                controller.add(
                                  DeleteOrderEvent(
                                    orderID: orderModel.orderID,
                                  ),
                                );
                              },
                              child: const Text("حذف"),
                            ),
                          ],
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.delete,
                    ),
                    label: const Text("حذف"),
                    style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(ColorsManger.red),
                      foregroundColor:
                          MaterialStatePropertyAll(ColorsManger.white),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
