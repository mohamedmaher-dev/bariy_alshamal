import 'package:bariy_alshamal/core/utils/popup_loading_manger.dart';
import 'package:bariy_alshamal/features/admin/products/data/models/admin_product_list_model.dart';
import 'package:bariy_alshamal/features/admin/products/data/rebo/admin_products_rebo.dart';
import 'package:bariy_alshamal/features/admin/products/data/rebo/rebos/admin_products_remote_rebo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'admin_products_event.dart';
part 'admin_products_state.dart';

class AdminProductsBloc extends Bloc<AdminProductsEvent, AdminProductsState> {
  AdminProductsRebo adminProductsRebo = AdminProductsRemoteRebo();
  late AdminProductListModel products;
  AdminProductsBloc() : super(AdminProductsInitial()) {
    on<AdminProductsEvent>((event, emit) async {
      switch (event) {
        case AdminProductsInitEvent():
          {
            await getProdcuts(emit);
          }
          break;
        case DeleteProductEvent():
          {
            PopUpLoading.loading();
            try {
              await adminProductsRebo.deleteProduct(
                  prodctsID: event.productID, imageUrl: event.imageUrl);
              PopUpLoading.success("تم حذف المنتج بنجاح");
              await getProdcuts(emit);
            } catch (e) {
              PopUpLoading.error(e.toString());
            }
          }
          break;
        case ChangeActiveEvent():
          {
            PopUpLoading.loading();
            try {
              await adminProductsRebo.changeActive(
                prodctsID: event.productID,
                currentActive: event.currentActive,
              );
              PopUpLoading.success("تم تعديل المنتج بنجاح");
              await getProdcuts(emit);
            } catch (e) {
              PopUpLoading.error(e.toString());
            }
          }
          break;
      }
    });
  }

  Future<void> getProdcuts(Emitter<AdminProductsState> emit) async {
    emit(AdminProductsLoading());
    try {
      products = AdminProductListModel.fromList(
        data: await adminProductsRebo.getProducts(),
      );
      if (products.list.isEmpty) {
        emit(AdminProductsEmpty());
      } else {
        emit(AdminProductsSuccess());
      }
    } catch (e) {
      emit(AdminProductsFailed());
    }
  }
}
