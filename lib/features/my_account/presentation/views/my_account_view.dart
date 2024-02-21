// ignore_for_file: use_build_context_synchronously

import 'package:bariy_alshamal/core/assets/assets_manger.dart';
import 'package:bariy_alshamal/core/themes/colors_manger.dart';
import 'package:bariy_alshamal/core/themes/text_styles.dart';
import 'package:bariy_alshamal/core/utils/app_manger.dart';
import 'package:bariy_alshamal/core/utils/app_route.dart';
import 'package:bariy_alshamal/core/utils/popup_loading_manger.dart';
import 'package:bariy_alshamal/core/widgets/app_bar_view.dart';
import 'package:bariy_alshamal/features/my_account/presentation/views/widgets/we_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
                    onTap: () {
                      Uri url = Uri.parse("https://wa.me/966581388885");
                      launchUrl(url, mode: LaunchMode.externalApplication);
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
                      String email = Uri.encodeComponent("albiji95@gmail.com");
                      String? encodeQueryParameters(
                          Map<String, String> params) {
                        return params.entries
                            .map((MapEntry<String, String> e) =>
                                '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                            .join('&');
                      }

                      final Uri emailLaunchUri = Uri(
                        scheme: 'mailto',
                        path: email,
                        query: encodeQueryParameters(
                          <String, String>{
                            'subject': 'Bariy Alshamal App - تطبيق بري الشمال',
                            'body': '',
                          },
                        ),
                      );
                      if (await canLaunchUrl(emailLaunchUri)) {
                        launchUrl(emailLaunchUri);
                      } else {
                        await Clipboard.setData(
                          const ClipboardData(text: "albiji95@gmail.com"),
                        );
                        PopUpLoading.success("تم نسخ البريد الألكتروني بنجاح");
                      }
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
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return Align(
                        child: Card(
                          margin: EdgeInsets.all(10.w),
                          child: ListView(
                            shrinkWrap: true,
                            children: <Widget>[
                              ListTile(
                                title: Text(
                                  "من نحن؟",
                                  style: TextStyles.tsG20B,
                                ),
                              ),
                              const WeItem(
                                text:
                                    "يتم تربية الأ غنام في اوديه شمال المملكه",
                              ),
                              const WeItem(
                                text: "يتم تغذية الاغنام علي اعلاف طبيعية %100",
                              ),
                              const WeItem(
                                text: "خالية من الابر و الادوية",
                              ),
                              const WeItem(
                                text: "يتم الذبح في مسالخ البلدية",
                              ),
                              const WeItem(
                                text: "التوصيل بسيارات مبرده",
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              }),
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
            onTap: () {
              launchUrl(
                Uri.parse(
                  "https://www.freeprivacypolicy.com/live/0535a6c3-d4aa-4ba7-96b5-ffc51fe3c052",
                ),
                mode: LaunchMode.externalApplication,
              );
            },
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
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return const AlertDialog(
                    title: Text("الشروط و الأحكام"),
                    content: Text(
                      "الشروط والاحكام \nالتطبيق \nهو تطبيق بري الشمال \nالعميل \nهو الشخص الذي يستخدم التطبيق سواء كان الشخص طبيعي أو اعتباري. \nالموافقة على بنود العقد \nتعتبر الخصوصيه عند استخدامك لتطبيق (بري الشمال ) فهذا يعتبر بمثابة موافقة منك على بنود العقد الواردة في هذه الاتفاقية، إن كنت لا توافق على هذه البنود ، فعليك التوقف عن استخدام التطبيق. \nالتغييرات على الاتفاقية \nعند إجراء أي تغيير على الاتفاقية فسوف يتم إعلامكم بذلك في أقرب وقت ممكن عن طريق نشر التغييرات على التطبيق \nالدفع المسبق \nيحق لتطبيق (بري الشمال ) في أي وقت طلب الدفع المسبق بدون إبداء أي أسباب. \nقبول طلبات الشراء \nيحق لتطبيق (بري الشمال) إلغاء الطلب دون إشعار. \nحقوق الملكية الفكرية \nجميع المحتويات الواردة في تطبيق (بري الشمال ) بما في ذلك وليس محصورًا (الشعارات، الصور، المقاطع الصوتية، الرموز، البرمجيات) نحتفظ بجميع حقوقنا وملكيتنا بالتطبيق والخدمات - وذلك على سبيل المثال لا الحصر - بجميع حقوق الملكية الفكرية الواردة ضمن شروط الاستخدام \nالقانون التي تخضع له الشروط \nتخضع شروط الاستخدام لقانون المملكة العربية السعودية. \nخدمة العملاء \nنقوم بتوفير اجود انواع الذبائح تحت رعاية بيطرية ونقوم بالذبح فى مصلخ البلدية تحت اشراف طبى ونغلف الذبائح ايضا حسب طلب العميل بايدى عاملة مدربة كما نقوم بتوصيلها بسيارات مبردة الى منازل العملاء وتتميز منتجاتنا بالجودة العالية والأسعار المناسبة . \nموقعنا : \nالمملكة العربية السعودية - لرياض - حفر الباطن \n",
                    ),
                  );
                },
              );
            },
          ),
          Padding(
            padding: EdgeInsets.all(15.w),
            child: ElevatedButton.icon(
              onPressed: () async {
                if (AppManger.isLogin) {
                  PopUpLoading.loading();
                  await FirebaseAuth.instance.signOut();
                  PopUpLoading.dismiss();
                  AppRoute.pushAndRemoveUntil(
                      context: context, page: Pages.splash);
                } else {
                  AppRoute.push(context: context, page: Pages.signIn);
                }
              },
              icon: Icon(AppManger.isLogin ? Icons.exit_to_app : Icons.add),
              label: Text(
                AppManger.isLogin ? "تسجيل الخروج" : "تسجيل الدخول",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12.sp,
                ),
              ),
              style: ButtonStyle(
                backgroundColor:
                    const MaterialStatePropertyAll(Colors.transparent),
                elevation: const MaterialStatePropertyAll(0),
                foregroundColor: MaterialStatePropertyAll(
                  AppManger.isLogin ? ColorsManger.red : ColorsManger.green,
                ),
              ),
            ),
          ),
          if (AppManger.isLogin)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: ElevatedButton.icon(
                onPressed: () async {
                  if (AppManger.isLogin) {
                    PopUpLoading.loading();
                    await FirebaseFirestore.instance
                        .collection('users')
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .delete();
                    await FirebaseAuth.instance.currentUser!.delete();
                    PopUpLoading.dismiss();
                    AppRoute.pushAndRemoveUntil(
                        context: context, page: Pages.splash);
                  } else {
                    AppRoute.push(context: context, page: Pages.signIn);
                  }
                },
                icon: const Icon(Icons.delete),
                label: Text(
                  'حذف الحساب',
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
