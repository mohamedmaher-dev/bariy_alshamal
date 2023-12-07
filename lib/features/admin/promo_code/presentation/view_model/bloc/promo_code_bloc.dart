import 'package:bariy_alshamal/core/utils/popup_loading_manger.dart';
import 'package:bariy_alshamal/features/admin/promo_code/data/models/promo_code_list_model.dart';
import 'package:bariy_alshamal/features/admin/promo_code/data/rebo/promo_code_rebo.dart';
import 'package:bariy_alshamal/features/admin/promo_code/data/rebo/rebos/promo_code_remote_rebo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'promo_code_event.dart';
part 'promo_code_state.dart';

class PromoCodeBloc extends Bloc<PromoCodeEvent, PromoCodeState> {
  PromoCodeRebo rebo = PromoCodeRemoteRebo();
  late PromoCodeListModel promoCodes;
  TextEditingController promoCodeTextFieldController = TextEditingController();
  PromoCodeBloc() : super(PromoCodeInitial()) {
    on<PromoCodeEvent>(
      (event, emit) async {
        switch (event) {
          case PromoCodeInit():
            {
              await getCodes(emit);
            }
            break;
          case AddPromoCode():
            {
              if (promoCodeTextFieldController.text.isEmpty) {
                PopUpLoading.error("برجاء كتابة قيمة الخصم");
              } else {
                PopUpLoading.loading();
                try {
                  await rebo.addPromoCode(
                    value: int.parse(promoCodeTextFieldController.text),
                    code: rebo.codeGenerator(length: 6),
                  );
                  PopUpLoading.success("تم اضافة كود الخصم بنجاح");
                  await getCodes(emit);
                } catch (e) {
                  PopUpLoading.error("حدث خطأ ما");
                }
              }
            }
            break;
          case DeletePromoCode():
            {
              PopUpLoading.loading();
              try {
                await rebo.deletePromoCode(
                  code: event.code,
                );
                PopUpLoading.success("تم حذف كود الخصم بنجاح");
                await getCodes(emit);
              } catch (e) {
                PopUpLoading.error("حدث خطأ ما");
              }
            }
            break;
        }
      },
    );
  }

  Future<void> getCodes(Emitter<PromoCodeState> emit) async {
    emit(PromoCodeLoading());
    try {
      promoCodes = PromoCodeListModel.fromList(
        data: await rebo.getPromoCodes(),
      );
      if (promoCodes.list.isEmpty) {
        emit(PromoCodeEmpty());
      } else {
        emit(PromoCodeSuccess());
      }
    } catch (e) {
      emit(PromoCodeFailed());
    }
  }
}
