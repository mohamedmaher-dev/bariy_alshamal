import 'package:bariy_alshamal/core/themes/colors_manger.dart';
import 'package:bariy_alshamal/core/themes/text_styles.dart';
import 'package:bariy_alshamal/core/utils/app_manger.dart';
import 'package:bariy_alshamal/core/widgets/app_bar_view.dart';
import 'package:bariy_alshamal/features/one_product/presntation/view_model/one_product_bloc/one_product_bloc.dart';
import 'package:bariy_alshamal/features/one_product/presntation/views/widgets/section_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OneProductView extends StatefulWidget {
  const OneProductView({super.key});

  @override
  State<OneProductView> createState() => _OneProductViewState();
}

class _OneProductViewState extends State<OneProductView> {
  late OneProductBloc controller;
  @override
  void initState() {
    controller = BlocProvider.of<OneProductBloc>(context);
    controller.add(OneProductInitEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OneProductBloc, OneProductState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBarView(title: controller.productModel.productName),
          bottomNavigationBar: ListView(
            shrinkWrap: true,
            children: [
              Text(
                "اجمالي التكلفة هي ${controller.totlaPrice} ريال سعودي",
                textAlign: TextAlign.center,
                style: TextStyles.tsP15B,
              ),
              controller.productModel.isActive && AppManger.isLogin
                  ? Padding(
                      padding: EdgeInsets.all(10.w),
                      child: ElevatedButton.icon(
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(ColorsManger.green),
                          foregroundColor:
                              MaterialStatePropertyAll(ColorsManger.white),
                        ),
                        onPressed: () {
                          controller.add(AddOrderToCart(context: context));
                        },
                        icon: const Icon(Icons.add),
                        label: Text(
                          "اضف الي السلة",
                          style: TextStyles.tsW15B,
                        ),
                      ),
                    )
                  : SizedBox(height: 10.h)
            ],
          ),
          body: ListView(
            children: [
              Padding(
                padding: EdgeInsets.all(10.w),
                child: Card(
                  color: ColorsManger.green,
                  child: ListTile(
                    title: Text(
                      "الكمية : ",
                      style: TextStyles.tsW15B,
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          onPressed: () {
                            controller.add(IncreaseCount());
                          },
                          icon: const Icon(
                            Icons.add,
                            color: ColorsManger.white,
                          ),
                        ),
                        Text(
                          controller.count.toString(),
                          style: TextStyles.tsW15B,
                        ),
                        IconButton(
                          onPressed: () {
                            controller.add(DecreaseCount());
                          },
                          icon: const Icon(
                            Icons.minimize_rounded,
                            color: ColorsManger.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.w),
                child: Card(
                  color: ColorsManger.green,
                  child: ListTile(
                    title: Text(
                      "تفاصيل المنتج : ",
                      style: TextStyles.tsW15B,
                    ),
                    subtitle: Text(
                      controller.productModel.productDetails,
                      style: TextStyles.tsW10N,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.w),
                child: Card(
                  color: ColorsManger.green,
                  child: ListTile(
                    title: Text(
                      "اضف ملاحظه",
                      style: TextStyles.tsW15B,
                    ),
                    subtitle: TextFormField(
                      controller: controller.noteController,
                      style: TextStyles.tsW10B,
                    ),
                  ),
                ),
              ),
              controller.productModel.sizes.list.isNotEmpty
                  ? SectionItem(
                      title: "الحجم : ",
                      groupValue: controller.size.details,
                      list: controller.productModel.sizes.list,
                      onPressed: (value, index) {
                        controller.add(SizeSelect(index: index));
                      },
                      onDelete: () {
                        controller.add(SizeDelete());
                      },
                    )
                  : const SizedBox.shrink(),
              controller.productModel.cutting.list.isNotEmpty
                  ? SectionItem(
                      title: "طريقة التقطيع : ",
                      groupValue: controller.cuttings.details,
                      list: controller.productModel.cutting.list,
                      onPressed: (value, index) {
                        controller.add(CuttingsSelect(index: index));
                      },
                      onDelete: () {
                        controller.add(CuttingsDelete());
                      },
                    )
                  : const SizedBox.shrink(),
              controller.productModel.packages.list.isNotEmpty
                  ? SectionItem(
                      title: "طريقة التغليف : ",
                      groupValue: controller.packages.details,
                      list: controller.productModel.packages.list,
                      onPressed: (value, index) {
                        controller.add(PackgesSelect(index: index));
                      },
                      onDelete: () {
                        controller.add(PackgesDelete());
                      },
                    )
                  : const SizedBox.shrink(),
              controller.productModel.mafroum.list.isNotEmpty
                  ? SectionItem(
                      title: "مفروم؟",
                      groupValue: controller.mafroum.details,
                      list: controller.productModel.mafroum.list,
                      onPressed: (value, index) {
                        controller.add(MafroumSelect(index: index));
                      },
                      onDelete: () {
                        controller.add(MafroumDelete());
                      },
                    )
                  : const SizedBox.shrink(),
              controller.productModel.head.list.isNotEmpty
                  ? SectionItem(
                      title: "الرأس : ",
                      groupValue: controller.head.details,
                      list: controller.productModel.head.list,
                      onPressed: (value, index) {
                        controller.add(HeadSelect(index: index));
                      },
                      onDelete: () {
                        controller.add(HeadDelete());
                      },
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        );
      },
    );
  }
}
