import 'package:bariy_alshamal/core/assets/assets_manger.dart';
import 'package:bariy_alshamal/core/themes/colors_manger.dart';
import 'package:bariy_alshamal/core/themes/text_styles.dart';
import 'package:bariy_alshamal/core/widgets/app_bar_view.dart';
import 'package:bariy_alshamal/core/widgets/buttom_nav_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAccountView extends StatelessWidget {
  const MyAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarView(title: "حسابي"),
      bottomNavigationBar: const ButtomNavBarView(),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(10.w),
            child: Card(
              color: ColorsManger.green,
              child: ListTile(
                title: Text(
                  "التواصل",
                  style: TextStyles.tsW15B,
                ),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    margin: EdgeInsets.all(10.w),
                    decoration: BoxDecoration(
                      color: ColorsManger.green,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.r),
                      ),
                    ),
                    child: Image.asset(AssetsManger.snapLogo),
                  ),
                ),
              ),
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    margin: EdgeInsets.all(10.w),
                    decoration: BoxDecoration(
                      color: ColorsManger.green,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.r),
                      ),
                    ),
                    child: Image.asset(AssetsManger.whatsLogo),
                  ),
                ),
              ),
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    margin: EdgeInsets.all(10.w),
                    decoration: BoxDecoration(
                      color: ColorsManger.green,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.r),
                      ),
                    ),
                    child: Image.asset(AssetsManger.xLogo),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(10.w),
            child: Card(
              color: ColorsManger.green,
              child: ListTile(
                title: Text(
                  "صفحات تعريفية",
                  style: TextStyles.tsW15B,
                ),
              ),
            ),
          ),
          ListTile(
            title: Text(
              "من نحن؟",
              style: TextStyles.tsP15B,
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              color: ColorsManger.green,
            ),
          ),
          const Divider(),
          ListTile(
            title: Text(
              "سياسة الخصوصية",
              style: TextStyles.tsP15B,
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              color: ColorsManger.green,
            ),
          ),
          const Divider(),
          ListTile(
            title: Text(
              "الشروط و الأحكام",
              style: TextStyles.tsP15B,
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              color: ColorsManger.green,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.w),
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.exit_to_app_rounded),
              label: Text(
                "تسجيل الخروج",
                style: TextStyles.tsW12B,
              ),
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(ColorsManger.red),
                foregroundColor: MaterialStatePropertyAll(ColorsManger.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
