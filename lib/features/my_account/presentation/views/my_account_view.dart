import 'package:bariy_alshamal/core/assets/assets_manger.dart';
import 'package:bariy_alshamal/core/themes/colors_manger.dart';
import 'package:bariy_alshamal/core/themes/text_styles.dart';
import 'package:bariy_alshamal/core/utils/app_manger.dart';
import 'package:bariy_alshamal/core/utils/app_route.dart';
import 'package:bariy_alshamal/core/utils/popup_loading_manger.dart';
import 'package:bariy_alshamal/core/widgets/app_bar_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class MyAccountView extends StatelessWidget {
  const MyAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarView(title: "حسابي"),
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
                  child: GestureDetector(
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
                    onTap: () {
                      launchUrl(
                        Uri.parse(
                            "https://www.snapchat.com/add/wildnorth1?share_id=6cNjF3gvpy0&locale=ar-AE"),
                        mode: LaunchMode.externalApplication,
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1,
                  child: GestureDetector(
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
                    onTap: () async {
                      await Clipboard.setData(
                        const ClipboardData(text: "0581388885"),
                      );
                      PopUpLoading.success("تم نسخ الرقم بنجاح");
                    },
                  ),
                ),
              ),
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1,
                  child: GestureDetector(
                    child: Container(
                      margin: EdgeInsets.all(10.w),
                      decoration: BoxDecoration(
                        color: ColorsManger.green,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.r),
                        ),
                      ),
                      child: Image.asset(AssetsManger.mailLogo),
                    ),
                    onTap: () async {
                      await Clipboard.setData(
                        const ClipboardData(text: "albiji95@gmail.com"),
                      );
                      PopUpLoading.success("تم نسخ البريد الألكتروني بنجاح");
                    },
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
              onPressed: () {
                if (AppManger.isLogin) {
                  FirebaseAuth.instance.signOut();
                  AppRoute.pushAndRemoveUntil(
                      context: context, page: Pages.splash);
                } else {
                  AppRoute.push(context: context, page: Pages.signIn);
                }
              },
              icon: Icon(AppManger.isLogin ? Icons.exit_to_app : Icons.add),
              label: Text(
                AppManger.isLogin ? "تسجيل الخروج" : "تسجيل الدخول",
                style: TextStyles.tsW12B,
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                  AppManger.isLogin ? ColorsManger.red : ColorsManger.green,
                ),
                foregroundColor:
                    const MaterialStatePropertyAll(ColorsManger.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
