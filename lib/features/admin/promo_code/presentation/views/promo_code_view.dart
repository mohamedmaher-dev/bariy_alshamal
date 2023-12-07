import 'package:bariy_alshamal/core/themes/colors_manger.dart';
import 'package:bariy_alshamal/core/utils/app_route.dart';
import 'package:bariy_alshamal/core/widgets/app_bar_view.dart';
import 'package:bariy_alshamal/core/widgets/empty_view.dart';
import 'package:bariy_alshamal/features/admin/promo_code/presentation/view_model/bloc/promo_code_bloc.dart';
import 'package:bariy_alshamal/features/admin/promo_code/presentation/views/widgets/promo_code_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PromoCodeView extends StatefulWidget {
  const PromoCodeView({super.key});

  @override
  State<PromoCodeView> createState() => _PromoCodeViewState();
}

class _PromoCodeViewState extends State<PromoCodeView> {
  late PromoCodeBloc controller;

  @override
  void initState() {
    controller = BlocProvider.of<PromoCodeBloc>(context);
    controller.add(PromoCodeInit());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarView(title: "اكواد الخصم"),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorsManger.green,
        foregroundColor: ColorsManger.white,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text("اضف كود خصم"),
              content: TextFormField(
                controller: controller.promoCodeTextFieldController,
                decoration: const InputDecoration(hintText: "قيمة الخصم"),
                keyboardType: TextInputType.number,
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    AppRoute.pop(context: context);
                    controller.add(AddPromoCode());
                  },
                  child: const Text("اضف"),
                )
              ],
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      body: BlocBuilder<PromoCodeBloc, PromoCodeState>(
        builder: (context, state) {
          switch (state) {
            case PromoCodeInitial():
              return const Center(
                child: CircularProgressIndicator(),
              );
            case PromoCodeLoading():
              return const Center(
                child: CircularProgressIndicator(),
              );
            case PromoCodeFailed():
              return const Center(
                child: Icon(Icons.error),
              );
            case PromoCodeSuccess():
              return ListView.builder(
                itemBuilder: (context, index) => PromoCodeItem(
                  controller: controller,
                  promoCodeModle: controller.promoCodes.list[index],
                ),
                itemCount: controller.promoCodes.list.length,
              );
            case PromoCodeEmpty():
              return const EmptyViwe();
          }
        },
      ),
    );
  }
}
