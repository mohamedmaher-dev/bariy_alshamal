import 'package:bariy_alshamal/core/themes/colors_manger.dart';
import 'package:bariy_alshamal/core/utils/popup_loading_manger.dart';
import 'package:bariy_alshamal/core/widgets/app_bar_view.dart';
import 'package:bariy_alshamal/features/cart/presntation/view_model/cart_bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class MyMapView extends StatefulWidget {
  const MyMapView({super.key});

  @override
  State<MyMapView> createState() => _MyMapViewState();
}

class _MyMapViewState extends State<MyMapView> {
  LatLng postion = const LatLng(21.422510, 39.826168);
  MapController mapController = MapController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarView(title: "تحديد الموقع"),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
            backgroundColor: ColorsManger.green,
            foregroundColor: ColorsManger.white,
            onPressed: () async {
              bool locationIsEnable =
                  await Geolocator.isLocationServiceEnabled();
              LocationPermission permission =
                  await Geolocator.checkPermission();
              if (locationIsEnable) {
                if (permission == LocationPermission.always) {
                  Position myPostion = await Geolocator.getCurrentPosition();
                  setState(() {
                    postion = LatLng(myPostion.latitude, myPostion.longitude);
                    mapController.move(postion, 10);
                  });
                } else {
                  Geolocator.requestPermission();
                }
              } else {
                PopUpLoading.error("الرجاء تشغيل GPS");
              }
            },
            label: const Text("تحديد موقعي"),
            icon: const Icon(Icons.location_history),
          ),
          SizedBox(height: 10.h),
          FloatingActionButton.extended(
            backgroundColor: ColorsManger.green,
            foregroundColor: ColorsManger.white,
            onPressed: () {
              BlocProvider.of<CartBloc>(context).myLocation = postion;
              PopUpLoading.success("تم اختيار الموقع بنجاح");
              Navigator.of(context).pop();
            },
            label: const Text("تأكيد"),
            icon: const Icon(Icons.done),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      body: FlutterMap(
        mapController: mapController,
        options: MapOptions(
          initialCenter: postion,
          initialZoom: 10,
          interactionOptions: const InteractionOptions(
            enableScrollWheel: false,
          ),
          minZoom: 1,
          maxZoom: 20,
          onTap: (tapPosition, point) {
            setState(() {
              postion = point;
            });
          },
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app',
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: postion,
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
      ),
    );
  }
}
