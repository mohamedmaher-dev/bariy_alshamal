import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/themes/colors_manger.dart';
import '../../../../../core/themes/text_styles.dart';

class SheepItem extends StatelessWidget {
  const SheepItem({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: ColorsManger.green,
      ),
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          AspectRatio(
            aspectRatio: 3 / 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: Image.asset(
                "assets/images/3.jpg",
                fit: BoxFit.fill,
              ),
            ),
          ),
          ListTile(
            title: Text(
              data[index]["name"],
              textAlign: TextAlign.center,
              style: TextStyles.tsW15B,
            ),
            subtitle: Text(
              data[index]["status"],
              textAlign: TextAlign.center,
              style: data[index]["status"] == "قريبا"
                  ? TextStyles.tsR10B
                  : TextStyles.tsG10B,
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              color: ColorsManger.gold,
            ),
          ),
        ],
      ),
    );
  }
}

List data = [
  {
    "name": "نعيمي",
    "status": "متوفر",
  },
  {
    "name": "حري",
    "status": "قريبا",
  },
  {
    "name": "تيس",
    "status": "قريبا",
  },
  {
    "name": "عجل",
    "status": "قريبا",
  },
  {
    "name": "حاشي",
    "status": "قريبا",
  },
  {
    "name": "نجدي",
    "status": "قريبا",
  },
];
