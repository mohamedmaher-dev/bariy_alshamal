import 'package:bariy_alshamal/core/themes/colors_manger.dart';
import 'package:bariy_alshamal/core/themes/text_styles.dart';
import 'package:bariy_alshamal/core/widgets/app_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OneProductView extends StatelessWidget {
  const OneProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarView(title: "ذبيحة تيس بلدي كاملة"),
      bottomNavigationBar: ListView(
        shrinkWrap: true,
        children: [
          Text(
            "اجمالي السعر هو 1300",
            textAlign: TextAlign.center,
            style: TextStyles.tsP15B,
          ),
          Padding(
            padding: EdgeInsets.all(10.w),
            child: ElevatedButton.icon(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(ColorsManger.green),
                foregroundColor: MaterialStatePropertyAll(ColorsManger.white),
              ),
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: Text(
                "اضف الي السلة",
                style: TextStyles.tsW15B,
              ),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(10.w),
            child: Card(
              child: ListTile(
                title: Text(
                  "الكمية : ",
                  style: TextStyles.tsP15B,
                ),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                        color: ColorsManger.green,
                      ),
                    ),
                    Text(
                      "1",
                      style: TextStyles.tsP15B,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.minimize_rounded,
                        color: ColorsManger.green,
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
              child: ListTile(
                title: Text(
                  "تفاصيل المنتج : ",
                  style: TextStyles.tsP15B,
                ),
                subtitle: const Text(
                  "إذا كنت تبحث عن نظام غذائي غني بالبروتين للحفاظ على صحة عضلاتك .. او كنت تبحث عن لحوم بسعرات حرارية منخفضة ومستويات متدنية من الكوليسترول والدهون المشبعة فإن لحم الماعز يعمل بشكل مناسب لك",
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.w),
            child: Card(
              child: ListTile(
                title: Text(
                  "الحجم : ",
                  style: TextStyles.tsP15B,
                ),
                subtitle: const Text("لم يتم التحديد"),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: ColorsManger.green,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.w),
            child: Card(
              child: ListTile(
                title: Text(
                  "طريقة التقطيع : ",
                  style: TextStyles.tsP15B,
                ),
                subtitle: const Text("لم يتم التحديد"),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: ColorsManger.green,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.w),
            child: Card(
              child: ListTile(
                title: Text(
                  "طريقة التغليف : ",
                  style: TextStyles.tsP15B,
                ),
                subtitle: const Text("لم يتم التحديد"),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: ColorsManger.green,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.w),
            child: Card(
              child: ListTile(
                title: Text(
                  "مفروم؟",
                  style: TextStyles.tsP15B,
                ),
                subtitle: const Text("لم يتم التحديد"),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: ColorsManger.green,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.w),
            child: Card(
              child: ListTile(
                title: Text(
                  "الرأس : ",
                  style: TextStyles.tsP15B,
                ),
                subtitle: const Text("لم يتم التحديد"),
                trailing: IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      enableDrag: true,
                      showDragHandle: true,
                      context: context,
                      builder: (context) => const ExtraChoiceSheet(),
                    );
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: ColorsManger.green,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ExtraChoiceSheet extends StatelessWidget {
  const ExtraChoiceSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Card(
          color: ColorsManger.green,
          child: ListTile(
            title: Text(
              "مفروم؟ : ",
              style: TextStyles.tsW15B,
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_forward_ios_rounded,
                color: ColorsManger.white,
              ),
            ),
          ),
        ),
        RadioListTile(
          title: Text(
            "نعم",
            style: TextStyles.tsP15B,
          ),
          value: true,
          groupValue: true,
          onChanged: (value) {},
        ),
        RadioListTile(
          title: Text(
            "لا",
            style: TextStyles.tsP15B,
          ),
          value: true,
          groupValue: false,
          onChanged: (value) {},
        ),
      ],
    );
  }
}
