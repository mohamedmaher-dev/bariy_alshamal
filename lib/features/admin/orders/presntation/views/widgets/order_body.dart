import 'package:bariy_alshamal/core/themes/colors_manger.dart';
import 'package:bariy_alshamal/core/themes/text_styles.dart';
import 'package:bariy_alshamal/features/admin/orders/presntation/data/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jiffy/jiffy.dart';

class OrderBody extends StatelessWidget {
  const OrderBody({super.key, required this.orderModel});
  final OrderModel orderModel;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.all(10.w),
      children: [
        ListTile(
          leading: const Icon(
            Icons.numbers,
            color: ColorsManger.green,
          ),
          title: Text(
            orderModel.orderID,
            style: TextStyles.tsP10B,
          ),
          subtitle: Text(
            "الرقم التعريفي للطلب",
            style: TextStyles.tsG10B,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: ListTile(
                leading: const Icon(
                  Icons.grid_view_rounded,
                  color: ColorsManger.green,
                ),
                title: Text(
                  orderModel.productsCount.toString(),
                  style: TextStyles.tsP10B,
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
                  color: ColorsManger.green,
                ),
                title: Text(
                  orderModel.orderPrice.toString(),
                  style: TextStyles.tsP10B,
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
                  color: ColorsManger.green,
                ),
                title: Text(
                  orderModel.discount.toString(),
                  style: TextStyles.tsP10B,
                ),
                subtitle: Text(
                  "الخصم",
                  style: TextStyles.tsG10B,
                ),
              ),
            ),
          ],
        ),
        ListTile(
          leading: const Icon(
            Icons.calendar_month,
            color: ColorsManger.green,
          ),
          title: Text(
            Jiffy.parse(orderModel.date.toString()).yMMMMEEEEdjm,
            style: TextStyles.tsP10B,
          ),
          subtitle: Text(
            "تاريخ الطلب بتوقيت جرينتش",
            style: TextStyles.tsG10B,
          ),
        ),
        const Divider(),
        Row(
          children: [
            Expanded(
              child: ListTile(
                title: Text(
                  orderModel.userName,
                  style: TextStyles.tsP10B,
                  textAlign: TextAlign.center,
                ),
                subtitle: Text(
                  "اسم العميل",
                  style: TextStyles.tsG10B,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              child: ListTile(
                title: Text(
                  orderModel.userPhone,
                  style: TextStyles.tsP10B,
                  textAlign: TextAlign.center,
                ),
                subtitle: Text(
                  "رقم العميل",
                  style: TextStyles.tsG10B,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              child: ListTile(
                title: Text(
                  orderModel.userCity,
                  style: TextStyles.tsP10B,
                  textAlign: TextAlign.center,
                ),
                subtitle: Text(
                  "المدينة",
                  style: TextStyles.tsG10B,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
        const Divider(),
        // Row(
        //   children: [
        //     Expanded(
        //       child: ListTile(
        //         title: Text(
        //           orderModel.bankAccountNum,
        //           style: TextStyles.tsP10B,
        //         ),
        //         subtitle: Text(
        //           "رقم الحساب البنكي",
        //           style: TextStyles.tsG10B,
        //         ),
        //       ),
        //     ),
        //     Expanded(
        //       child: ListTile(
        //         title: Text(
        //           orderModel.bankAccountName,
        //           style: TextStyles.tsP10B,
        //         ),
        //         subtitle: Text(
        //           "اسم الحساب البنكي",
        //           style: TextStyles.tsG10B,
        //         ),
        //       ),
        //     ),
        //     Expanded(
        //       child: ListTile(
        //         title: Text(
        //           orderModel.bankName,
        //           style: TextStyles.tsP10B,
        //         ),
        //         subtitle: Text(
        //           "اسم البنك",
        //           style: TextStyles.tsG10B,
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
        // SizedBox(height: 10.h),
        // ElevatedButton.icon(
        //   onPressed: () {
        //     showDialog(
        //       context: context,
        //       builder: (context) {
        //         return Scaffold(
        //           backgroundColor: Colors.black,
        //           appBar: AppBar(
        //             iconTheme: const IconThemeData(
        //               color: Colors.white,
        //             ),
        //             backgroundColor: Colors.black,
        //           ),
        //           body: Center(
        //             child: CachedNetworkImage(
        //               placeholder: (context, url) =>
        //                   const CircularProgressIndicator(),
        //               imageUrl: orderModel.screenUrl,
        //             ),
        //           ),
        //         );
        //       },
        //     );
        //   },
        //   icon: const Icon(Icons.image),
        //   label: const Text("عرض ايصال الدفع"),
        //   style: const ButtonStyle(
        //     foregroundColor: MaterialStatePropertyAll(ColorsManger.white),
        //     backgroundColor: MaterialStatePropertyAll(ColorsManger.green),
        //   ),
        // ),
        // const Divider(),
        ListView.builder(
          itemCount: orderModel.products.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => _ProductItem(
            orderModel: orderModel,
            index: index,
          ),
        )
      ],
    );
  }
}

class _ProductItem extends StatelessWidget {
  const _ProductItem({required this.orderModel, required this.index});
  final OrderModel orderModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        CircleAvatar(
          foregroundColor: ColorsManger.white,
          backgroundColor: ColorsManger.green,
          child: Text(
            (index + 1).toString(),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: ColorsManger.green, width: 2.w),
            borderRadius: BorderRadius.circular(10.r),
          ),
          margin: EdgeInsets.all(5.w),
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Row(
                children: [
                  Expanded(
                    child: ListTile(
                      title: Text(
                        orderModel.products[index].productName,
                        style: TextStyles.tsP10B,
                      ),
                      subtitle: Text(
                        "اسم المنتج",
                        style: TextStyles.tsG10B,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: Text(
                        orderModel.products[index].count.toString(),
                        style: TextStyles.tsP10B,
                      ),
                      subtitle: Text(
                        "الكمية",
                        style: TextStyles.tsG10B,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: Text(
                        orderModel.products[index].totalPrice.toString(),
                        style: TextStyles.tsP10B,
                      ),
                      subtitle: Text(
                        "تكلفة المنتج",
                        style: TextStyles.tsG10B,
                      ),
                    ),
                  ),
                ],
              ),
              ListTile(
                title: Text(
                  orderModel.products[index].note!.isEmpty
                      ? "لا يوجد"
                      : orderModel.products[index].note!,
                  style: TextStyles.tsP10B,
                  textAlign: TextAlign.center,
                ),
                subtitle: Text(
                  "ملاحظه",
                  style: TextStyles.tsG10B,
                  textAlign: TextAlign.center,
                ),
              ),
              if (orderModel.products[index].head != null)
                ListTile(
                  title: Text(
                    orderModel.products[index].head!,
                    style: TextStyles.tsP10B,
                  ),
                  subtitle: Text(
                    "الرأس",
                    style: TextStyles.tsG10B,
                  ),
                ),
              Row(
                children: [
                  if (orderModel.products[index].cut != null)
                    Expanded(
                      child: ListTile(
                        title: Text(
                          orderModel.products[index].cut!,
                          style: TextStyles.tsP10B,
                        ),
                        subtitle: Text(
                          "التقطيع",
                          style: TextStyles.tsG10B,
                        ),
                      ),
                    ),
                  if (orderModel.products[index].mafroum != null)
                    Expanded(
                      child: ListTile(
                        title: Text(
                          orderModel.products[index].mafroum!,
                          style: TextStyles.tsP10B,
                        ),
                        subtitle: Text(
                          "مفروم",
                          style: TextStyles.tsG10B,
                        ),
                      ),
                    ),
                ],
              ),
              Row(
                children: [
                  if (orderModel.products[index].package != null)
                    Expanded(
                      child: ListTile(
                        title: Text(
                          orderModel.products[index].package!,
                          style: TextStyles.tsP10B,
                        ),
                        subtitle: Text(
                          "التغليف",
                          style: TextStyles.tsG10B,
                        ),
                      ),
                    ),
                  if (orderModel.products[index].size != null)
                    Expanded(
                      child: ListTile(
                        title: Text(
                          orderModel.products[index].size!,
                          style: TextStyles.tsP10B,
                        ),
                        subtitle: Text(
                          "الحجم",
                          style: TextStyles.tsG10B,
                        ),
                      ),
                    ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
