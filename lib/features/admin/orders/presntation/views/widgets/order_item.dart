import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/themes/colors_manger.dart';
import 'field_item.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key});

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
          const Row(
            children: [
              FieldItem(title: "اسم المنتج", value: "نصف ذبيحة تيس بلدي"),
            ],
          ),
          const Row(
            children: [
              FieldItem(title: "تكلفة المنتج", value: "1500"),
              FieldItem(title: "تاريخ الطلب", value: "28/11/2023"),
            ],
          ),
          const Divider(),
          const Row(
            children: [
              FieldItem(title: "الحجم", value: "هرفي 4 شهور"),
              FieldItem(title: "الرأس", value: "بدون"),
            ],
          ),
          const Row(
            children: [
              FieldItem(title: "طريقة التغليف", value: "مغلف"),
              FieldItem(title: "مفروم", value: "نعم"),
            ],
          ),
          const Row(
            children: [
              FieldItem(title: "طريقة التقطيع", value: "نصفين بالطول"),
            ],
          ),
          const Divider(),
          const Row(
            children: [
              FieldItem(title: "اسم العميل", value: "محمد ماهر"),
              FieldItem(title: "رقم العميل", value: "0123456789"),
            ],
          ),
          const Divider(),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(10.w),
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.done,
                    ),
                    label: const Text("قبول"),
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
                    onPressed: () {},
                    icon: const Icon(
                      Icons.close,
                    ),
                    label: const Text("رفض"),
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
